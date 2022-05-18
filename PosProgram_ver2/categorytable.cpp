#include "categorytable.h"

CategoryTable::CategoryTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    cartegoryTable.append({"라면", "과자", "음료", "빵", "아이스\n크림"});
    cartegoryTable.append({"커피", "주류", "껌", "사탕", "삼각김밥"});
    cartegoryTable.append({"편의용품", "세제", "견과류", "마른안주", "냉동식품"});
}

int CategoryTable::rowCount(const QModelIndex &) const{
    return cartegoryTable.size();
}

int CategoryTable::columnCount(const QModelIndex &) const{
    return cartegoryTable.at(0).size();
}

QVariant CategoryTable::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return cartegoryTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> CategoryTable::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "categorytabledata";
    roles[HeadingRole] = "heading";
    return roles;
}
