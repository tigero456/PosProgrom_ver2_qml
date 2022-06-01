#include "manegeproducttable.h"

#include <QQmlApplicationEngine>
#include <QAbstractItemModel>

ManegeProductTable::ManegeProductTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;

    query.prepare("select p.product_code as '상품코드', p.product_name as '상품명', p.product_sale as '가격', i.inventory_life as '유통기한', i.inventory_number as '수량' from product p join inventory i on p.product_code = i.product_code order by p.cartegory_code, p.product_code"); //쿼리문 저장-분류에 맞는 컬럼값들 가져오기
    query.exec();

    while(query.next()){
        mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()});
    }
}

int ManegeProductTable::rowCount(const QModelIndex &) const{
    return mproductTable.size();
}

int ManegeProductTable::columnCount(const QModelIndex &) const{
    return mproductTable.at(0).size();
}

QVariant ManegeProductTable::data(const QModelIndex &index, int role) const{
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

QHash<int, QByteArray> ManegeProductTable::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "mproductTabletabledata";
    roles[HeadingRole] = "heading";
    return roles;
}

