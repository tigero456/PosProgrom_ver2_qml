#pragma once

#ifndef BASKETTABLE_H
#define BASKETTABLE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include <QSql>
#include "sqlquerymodel.h"

class BasketTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit BasketTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void productnameSlot(QString &msg){
        this->beginResetModel();
        if(i==0){
            basketTable.clear();
        }
        int j=msg.indexOf('\n', Qt::CaseInsensitive);
        int k=msg.size();
        int m=k-j;

        msg.chop(m);
        //qDebug()<<msg;

        QSqlQuery query;

        query.prepare("select product_name, product_sale from product where product_name = '"+msg+"'");
        query.exec();
        query.next();

        basketTable.append({
                         QString::number(++i),
                         query.value(0).toString(),
                         query.value(1).toString(),
                         "1"
                     });
        this->endResetModel();
    }

    Q_INVOKABLE void basketnumSlot(int &num){
        qDebug()<<num;
        count=num;
    }

    Q_INVOKABLE void basketnameSlot(QString &name){
        b_name.clear();
        qDebug()<<name;
        b_name=name;
    }

    Q_INVOKABLE void changeNum(){
        this->beginResetModel();
        f.clear();
        QVectorIterator<QVector<QString>> v(basketTable);

        int q=0;
        while(v.hasNext()){
            f = v.next();
            if(f.value(1) == b_name){
                break;
            }
            q++;
        }

        qDebug()<<f;
        qDebug()<<f.value(1);

        basketTable[q][3]=QString::number(count);

        qDebug()<< basketTable.value(q);
        this->endResetModel();
    }

private:
    QVector<QVector<QString>> basketTable;
    QString c_name=nullptr;
    int i=0;
    int count=0;
    QString b_name=nullptr;
    QVector<QString> f;
};

#endif // BASKETTABLE_H
