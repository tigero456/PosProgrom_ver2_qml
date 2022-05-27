#ifndef RAMEN_H
#define RAMEN_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include <QtSql>

class RaMen : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit RaMen(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

signals:

public slots:
private:
    QVector<QVector<QString>> ramenTable;

};

#endif // RAMEN_H
