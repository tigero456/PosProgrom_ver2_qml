#include "manageproducttable.h"

ManageProductTable::ManageProductTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;
    query.prepare("select product_code, product_name, product_sale, cartegory_code from product");
    query.exec();

    while(query.next()){
        mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString()});
    }
}

int ManageProductTable::rowCount(const QModelIndex &) const{
    return mproductTable.size();
}

int ManageProductTable::columnCount(const QModelIndex &) const{
    return mproductTable.at(0).size();
}

QVariant ManageProductTable::data(const QModelIndex &index, int role) const{
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

QHash<int, QByteArray> ManageProductTable::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "mproductTabletabledata";
    roles[HeadingRole] = "heading";
    return roles;
}

