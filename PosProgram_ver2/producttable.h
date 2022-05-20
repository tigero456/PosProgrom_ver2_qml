#ifndef PRODUCTTABLE_H
#define PRODUCTTABLE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class ProductTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit ProductTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

signals:
    void qmlSignal(QString msg);

public slots:
    void cppSlot(const QString &msg);

private:
    QVector<QVector<QString>> productTable;
    //QSqlTableModel *model;
    SqlQueryModel *db;
    QString c_name=nullptr;
};

#endif // PRODUCTTABLE_H
