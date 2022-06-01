#ifndef MPRODUCT_H
#define MPRODUCT_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class Mproduct : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit Mproduct(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void productSlot(){
        this->beginResetModel();
        QSqlQuery query;
        mproductTable.clear();

        query.prepare("select * from product");
        query.exec();

        while(query.next()){
            mproductTable.append({query.value(0).toString(), query.value(1).toString(), query.value(2).toString(), query.value(3).toString()});
        }
        qDebug()<<mproductTable;
        this->endResetModel();
    }

signals:

public slots:
private:
    QVector<QVector<QString>> mproductTable;
    SqlQueryModel *db;
    QString mp_name;

};

#endif // MPRODUCT_H
