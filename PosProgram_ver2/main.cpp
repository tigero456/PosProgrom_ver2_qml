#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tablemodel.h"
#include "categorytable.h"
#include "sqlquerymodel.h"
#include "producttable.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qmlRegisterType<TableModel>("TableModel", 0, 1, "TableModel");
    qmlRegisterType<CategoryTable>("CategoryTable", 0, 2, "CategoryTable");
    qmlRegisterType<ProductTable>("ProductTable", 0, 3, "ProductTable");
    qmlRegisterType<SqlQueryModel>("SqlQueryModel", 0, 4, "SqlQueryModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *item=engine.rootObjects().first();
    ProductTable CategoryNameObject;
    QObject::connect(item, SIGNAL(qmlSignal(QString)), &CategoryNameObject, SLOT(cppSlot(QString)));

    return app.exec();
}
