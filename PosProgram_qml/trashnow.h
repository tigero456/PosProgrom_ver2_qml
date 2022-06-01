#ifndef TRASHNOW_H
#define TRASHNOW_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include <QtSql>

class TrashNow : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit TrashNow(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void trashsendSlot(QString &msg){
        this->beginResetModel();
        QSqlQuery query;
        QString tr_code, tr_life, tr_sale, tr_num, tr_search_name, tr_search_life;
        QVectorIterator<QVector<QString>> v(trashnowTable);

        int q=0;
        while(v.hasNext()){
            f = v.next();
            if(f.value(0) == msg){
                break;
            }
            q++;
        }
        tr_sale=trashnowTable[q][1];
        tr_life=trashnowTable[q][2];
        tr_num=trashnowTable[q][3];

        query.prepare("select max(trash_life) from trash where trash_name = '"+msg+"'");
        query.exec();
        query.next();
        tr_search_life=query.value(0).toString();

        query.prepare("select trash_name from trash where trash_name = '"+msg+"'");
        query.exec();
        query.next();
        tr_search_name=query.value(0).toString();
        qDebug()<<msg;
        qDebug()<<tr_search_name;
        qDebug()<<tr_life;
        qDebug()<<tr_search_life;

        query.prepare("select product_code from product where product_name = '"+msg+"'");
        query.exec();
        query.next();
        tr_code=query.value(0).toString();

        query.prepare("delete from inventory where product_code = '"+tr_code+"' and inventory_life = '"+tr_life+"'");                         //준비
        query.exec();

        if(msg==tr_search_name && tr_life==tr_search_life){
            query.prepare("UPDATE trash SET trash_num = trash_num + "+tr_num+" WHERE trash_name = '"+msg+"' and trash_life = '"+tr_life+"'");
            query.exec();
        }
        else{
            query.prepare("insert into trash(trash_date, trash_name, trash_sale, trash_life, trash_num) values(now(), '"+msg+"', '"+tr_sale+"', '"+tr_life+"', '"+tr_num+"')");
            query.exec();
        }
        qDebug()<<trashnowTable;
        this->endResetModel();
    }

signals:

public slots:
private:
    QVector<QVector<QString>> trashnowTable;
    QVector<QString> f;

};

#endif // TRASHNOW_H
