#ifndef CATEGORYCOMBOBOX_H
#define CATEGORYCOMBOBOX_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class CategoryCombobox : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };
public:
    explicit CategoryCombobox(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;
signals:

private:
    QVector<QString> combomodel;
    SqlQueryModel *db;

};

#endif // CATEGORYCOMBOBOX_H
