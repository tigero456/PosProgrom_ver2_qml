#include "mproductcombobox.h"

MproductCombobox::MproductCombobox(QObject *parent)
    : QAbstractTableModel{parent}
{
}

int MproductCombobox::rowCount(const QModelIndex &) const{
    return mproductcomboboxTable.size();
}

int MproductCombobox::columnCount(const QModelIndex &) const{
    return mproductcomboboxTable.at(0).size();
}

QVariant MproductCombobox::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return mproductcomboboxTable.at(index.row());
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

QHash<int, QByteArray> MproductCombobox::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "mproductcomboboxdata";
    roles[HeadingRole] = "heading";
    return roles;
}
