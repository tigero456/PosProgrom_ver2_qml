#ifndef MPRODUCT_H
#define MPRODUCT_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class Mproduct : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit Mproduct(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void productSlot(){
        this->beginResetModel();
        QSqlQuery query;
        QString c_name;
        mproductTable.clear();

        query.prepare("select * from product");
        query.exec();

        while(query.next()){
            if(query.value(3).toString()=="1"){
                c_name="라면";
            }
            else if(query.value(3).toString()=="2"){
                c_name="과자";
            }
            else if(query.value(3).toString()=="3"){
                c_name="음료";
            }
            else if(query.value(3).toString()=="4"){
                c_name="아이스크림";
            }
            else if(query.value(3).toString()=="5"){
                c_name="빵";
            }
            else if(query.value(3).toString()=="6"){
                c_name="커피";
            }
            else if(query.value(3).toString()=="7"){
                c_name="주류";
            }
            else if(query.value(3).toString()=="8"){
                c_name="초콜릿";
            }
            else if(query.value(3).toString()=="9"){
                c_name="껌";
            }
            else if(query.value(3).toString()=="10"){
                c_name="냉동식품";
            }

            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), c_name});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

signals:

public slots:
private:
    QVector<QVector<QString>> mproductTable;
    SqlQueryModel *db;
    QString mp_name;

};

#endif // MPRODUCT_H
