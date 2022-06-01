#include "mproduct.h"

#include <QQmlApplicationEngine>
#include <QAbstractItemModel>

Mproduct::Mproduct(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;
    mproductTable.clear();

    query.prepare("select * from product");
    query.exec();

    while(query.next()){
        mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString()});
    }
    qDebug()<<mproductTable;
}

int Mproduct::rowCount(const QModelIndex &) const{
    return mproductTable.size();
}

int Mproduct::columnCount(const QModelIndex &) const{
    return mproductTable.at(0).size();
}

QVariant Mproduct::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return mproductTable.at(index.row()).at(index.column());
        case HeadingRole:
            if(index.row()==0){
                return true;
            } else{
                return false;
            }
        default:
            break;
    }

    return QVariant();
}

QHash<int, QByteArray> Mproduct::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "mproductdata";
    roles[HeadingRole] = "heading";
    return roles;
}

