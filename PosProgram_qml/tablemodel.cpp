#include "tablemodel.h"

TableModel::TableModel(QObject *parent)
    : QAbstractTableModel{parent}
{
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
    basketTable.append({"", "", "", ""});
}

int TableModel::rowCount(const QModelIndex &) const{
    return basketTable.size();
}

int TableModel::columnCount(const QModelIndex &) const{
    return basketTable.at(0).size();
}

QVariant TableModel::data(const QModelIndex &index, int role) const{
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

QHash<int, QByteArray> TableModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "basketabledata";
    roles[HeadingRole] = "heading";
    return roles;
}
