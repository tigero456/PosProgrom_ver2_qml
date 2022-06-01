#include "baskettable.h"

#include <QQmlApplicationEngine>
#include <QAbstractItemModel>

BasketTable::BasketTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    basketTable.clear();

    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});

}

int BasketTable::rowCount(const QModelIndex &) const{
    return basketTable.size();
}

int BasketTable::columnCount(const QModelIndex &) const{
    return basketTable.at(0).size();
}

QVariant BasketTable::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return basketTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> BasketTable::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "baskettabledata";
    roles[HeadingRole] = "heading";
    return roles;
}
