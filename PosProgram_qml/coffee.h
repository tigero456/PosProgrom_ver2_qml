#ifndef COFFEE_H
#define COFFEE_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include <QtSql>

class Coffee : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit Coffee(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

signals:

public slots:
private:
    QVector<QVector<QString>> coffeeTable;

};

#endif // COFFEE_H
