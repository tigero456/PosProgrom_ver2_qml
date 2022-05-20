#include "producttable.h"

ProductTable::ProductTable(QObject *parent)
    : QAbstractTableModel{parent}
{
    productTable.clear();

    if(c_name==nullptr){
        productTable.append({""});
    }
    else{
        //model = new QSqlTableModel(this);

        QSqlQuery query;
        QString c_code;

        query.prepare("select cartegory_code from cartegory where cartegory_name = '"+c_name+"'");
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
                productTable.append(e);
                e.clear();
                i=0;
            }
        }
    }
}

int ProductTable::rowCount(const QModelIndex &) const{
    return productTable.size();
}

int ProductTable::columnCount(const QModelIndex &) const{
    return productTable.at(0).size();
}

QVariant ProductTable::data(const QModelIndex &index, int role) const{
    switch(role){
        case TableDataRole:
            return productTable.at(index.row()).at(index.column());
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

QHash<int, QByteArray> ProductTable::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] = "producttabledata";
    roles[HeadingRole] = "heading";
    return roles;
}

void ProductTable::cppSlot(const QString &msg){
    c_name=msg;
    qDebug()<< c_name;
}
