#include "water.h"

WaTer::WaTer(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;
    QString c_code;

    query.prepare("select cartegory_code from cartegory where cartegory_name = '음료'");
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
            waterTable.append(e);
            e.clear();
            i=0;
        }
    }
}

int WaTer::rowCount(const QModelIndex &) const{
    return waterTable.size();
}

int WaTer::columnCount(const QModelIndex &) const{
    return waterTable.at(0).size();
}

QVariant WaTer::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return waterTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> WaTer::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "watertabledata";
    roles[HeadingRole] = "heading";
    return roles;
}

