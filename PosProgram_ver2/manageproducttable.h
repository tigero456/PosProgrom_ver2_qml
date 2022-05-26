#ifndef MANAGEPRODUCTTABLE_H
#define MANAGEPRODUCTTABLE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class ManageProductTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit ManageProductTable(QObject *parent = nullptr);
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

#endif // MANAGEPRODUCTTABLE_H
