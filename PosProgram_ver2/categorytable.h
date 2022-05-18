#ifndef CATEGORYTABLE_H
#define CATEGORYTABLE_H

#include <QObject>
#include <QAbstractTableModel>

class CategoryTable : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit CategoryTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

signals:

public slots:
private:
    QVector<QVector<QString>> cartegoryTable;

};

#endif // CATEGORYTABLE_H
