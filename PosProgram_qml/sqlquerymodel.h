#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H

#include <QObject>
#include <QtSql>

class SqlQueryModel: public QObject
{
    Q_OBJECT
public:
    SqlQueryModel(QObject *parent = nullptr);

private:
    QSqlDatabase db;
};

#endif // SQLQUERYMODEL_H
