#ifndef MPRODUCTCOMBOBOX_H
#define MPRODUCTCOMBOBOX_H

#include <QObject>
#include <QAbstractTableModel>
#include <QSqlTableModel>
#include "sqlquerymodel.h"

class MproductCombobox : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };

public:
    explicit MproductCombobox(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void mcategorynameSLOT(QString &msg){
        this->beginResetModel();
        mproductcomboboxTable.clear();
        QSqlQuery query;
        QString c_code;

        query.prepare("select cartegory_code from cartegory where cartegory_name = '"+msg+"'");
        query.exec();
        query.next();
        c_code=query.value(0).toString();

        query.prepare("select product_name from product where cartegory_code = "+c_code+"");
        query.exec();

        while(query.next()){
            mproductcomboboxTable.append(query.value(0).toString());
        }
        qDebug()<<mproductcomboboxTable;
        this->endResetModel();
    }

signals:

public slots:
private:
    QVector<QString> mproductcomboboxTable;
    SqlQueryModel *db;
    QString c_name=nullptr;

};

#endif // MPRODUCTCOMBOBOX_H
