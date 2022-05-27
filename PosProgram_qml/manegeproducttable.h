#ifndef MANEGEPRODUCTTABLE_H
#define MANEGEPRODUCTTABLE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class ManegeProductTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit ManegeProductTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

signals:

public slots:
private:
    QVector<QVector<QString>> mproductTable;
    //QSqlTableModel  *model;
    SqlQueryModel *db;

};

#endif // MANEGEPRODUCTTABLE_H
