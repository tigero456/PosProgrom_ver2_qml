#include "trashnow.h"

TrashNow::TrashNow(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;

    query.prepare("select p.product_name as '상품명', p.product_sale as '가격', i.inventory_life as '유통기한', i.inventory_number as '수량' from product p join inventory i on p.product_code = i.product_code where i.inventory_life < curdate()");                         //준비
    query.exec();

    while(query.next()){
        trashnowTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()});
    }
}

int TrashNow::rowCount(const QModelIndex &) const{
    return trashnowTable.size();
}

int TrashNow::columnCount(const QModelIndex &) const{
    return trashnowTable.at(0).size();
}

QVariant TrashNow::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return trashnowTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> TrashNow::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "trashnowdata";
    roles[HeadingRole] = "heading";
    return roles;
}

