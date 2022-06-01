#ifndef MANEGEPRODUCTTABLE_H
#define MANEGEPRODUCTTABLE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class ManegeProductTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit ManegeProductTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void mproductnameSlot(QString &name){
        qDebug()<<name;
    }

    Q_INVOKABLE void productSlot(){
        this->beginResetModel();
        QSqlQuery query;
        mproductTable.clear();

        query.prepare("select * from product");
        query.exec();

        while(query.next()){
            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString()});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

    Q_INVOKABLE void ivSlot(){
        this->beginResetModel();
        QSqlQuery query;
        mproductTable.clear();

        query.prepare("select p.product_code as '상품코드', p.product_name as '상품명', p.product_sale as '가격', i.inventory_life as '유통기한', i.inventory_number as '수량' from product p join inventory i on p.product_code = i.product_code order by p.cartegory_code, p.product_code"); //쿼리문 저장-분류에 맞는 컬럼값들 가져오기
        query.exec();

        while(query.next()){
            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

    Q_INVOKABLE void mproductcomboSlot(QString &comboname){
        this->beginResetModel();
        qDebug()<<comboname;
        qDebug()<<mproductTable.value(0);
        mproductTable.clear();
        qDebug()<<mproductTable;
        QSqlQuery query;
        QString c_code;

        query.prepare("select cartegory_code from cartegory where cartegory_name = '"+comboname+"'");
        query.exec();
        query.next();
        c_code = query.value(0).toString();

        query.prepare("select p.product_code as '상품코드', p.product_name as '상품명', p.product_sale as '가격', i.inventory_life as '유통기한', i.inventory_number as '수량' from product p join inventory i on p.product_code = i.product_code where cartegory_code = '"+c_code+"' order by p.cartegory_code, p.product_code"); //쿼리문 저장-분류에 맞는 컬럼값들 가져오기
        query.exec();

        while(query.next()){
            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

    Q_INVOKABLE void mproductsearchSlot(QString &searchname){
        this->beginResetModel();
        qDebug()<<searchname;
        mproductTable.clear();
        QSqlQuery query;

        query.prepare("select p.product_code as '상품코드', p.product_name as '상품명', p.product_sale as '가격', i.inventory_life as '유통기한', i.inventory_number as '수량' from product p join inventory i on p.product_code = i.product_code where product_name like '"+searchname+"%'");
        query.exec();

        while(query.next()){
            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

signals:

public slots:
private:
    QVector<QVector<QString>> mproductTable;
    //QSqlTableModel  *model;
    SqlQueryModel *db;
    QString mp_name;

};

#endif // MANEGEPRODUCTTABLE_H
