#include "categorytable.h"

CategoryTable::CategoryTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    db=new SqlQueryModel();
    //model = new QSqlTableModel(this);

    QSqlQuery query;

    query.prepare("select cartegory_name from cartegory");
    query.exec();

    QVector<QString> e;

    int i=0;
    while(query.next()){
        e.append(query.value(0).toString());
        i++;
        if(i==5){
            cartegoryTable.append(e);
            e.clear();
            i=0;
        }
    }
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

