#include "categorycombobox.h"

CategoryCombobox::CategoryCombobox(QObject *parent)
    : QAbstractTableModel{parent}
{
    QSqlQuery query;

     query.prepare("select cartegory_name from cartegory");
     query.exec();

     int i=0;
     while(query.next()){
         combomodel.append(query.value(0).toString());
         i++;
     }
     qDebug()<<combomodel;

}
int CategoryCombobox::rowCount(const QModelIndex &) const{
    return combomodel.size();
}

int CategoryCombobox::columnCount(const QModelIndex &) const{
    return combomodel.at(0).size();
}

QVariant CategoryCombobox::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return combomodel.at(index.row());
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

QHash<int, QByteArray> CategoryCombobox::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "categorycomboboxdata";
    roles[HeadingRole] = "heading";
    return roles;
}

