#include "bread.h"

Bread::Bread(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;
    QString c_code;

    query.prepare("select cartegory_code from cartegory where cartegory_name = '빵'");
    query.exec();
    query.next();
    c_code=query.value(0).toString();

    query.prepare("select product_name, product_sale from product where cartegory_code = "+c_code+"");
    query.exec();

    QVector<QString> e;

    int i=0;
    while(query.next()){
        e.append(query.value(0).toString() + "\n" + query.value(1).toString() + "원");
        i++;
        if(i==4){
            breadTable.append(e);
            e.clear();
            i=0;
        }
    }
}

int Bread::rowCount(const QModelIndex &) const{
    return breadTable.size();
}

int Bread::columnCount(const QModelIndex &) const{
    return breadTable.at(0).size();
}

QVariant Bread::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return breadTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> Bread::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "breadtabledata";
    roles[HeadingRole] = "heading";
    return roles;
}

