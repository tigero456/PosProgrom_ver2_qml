#include "sqlquerymodel.h"

#include <QDebug>

SqlQueryModel::SqlQueryModel(QObject *parent)
    :QObject (parent)
{
    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("store");
    db.setUserName("root");
    db.setPassword("dbrrns198!@&");

    if(db.open()) {
        qDebug() << "database is connected!";
    }
    else {
        qDebug() << "build error!";
    }
}
