#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCharts>
#include "tablemodel.h"
#include "categorytable.h"
#include "sqlquerymodel.h"
#include "producttable.h"
#include "manegeproducttable.h"
#include "ramen.h"
#include "snack.h"
#include "water.h"
#include "icecream.h"
#include "bread.h"
#include "coffee.h"
#include "alcohol.h"
#include "chocolate.h"
#include "baskettable.h"
#include "categorycombobox.h"
#include "mproductcombobox.h"
#include "addinventory.h"
#include "mproduct.h"
#include "trashnow.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    qmlRegisterType<TableModel>("TableModel", 0, 1, "TableModel");
    qmlRegisterType<CategoryTable>("CategoryTable", 0, 2, "CategoryTable");
    qmlRegisterType<ProductTable>("ProductTable", 0, 3, "ProductTable");
    qmlRegisterType<SqlQueryModel>("SqlQueryModel", 0, 4, "SqlQueryModel");
    qmlRegisterType<ManegeProductTable>("ManegeProductTable", 0, 5, "ManegeProductTable");
    qmlRegisterType<RaMen>("RaMen", 0, 6, "RaMen");
    qmlRegisterType<Snack>("Snack", 0, 7, "Snack");
    qmlRegisterType<WaTer>("WaTer", 0, 8, "WaTer");
    qmlRegisterType<IceCream>("IceCream", 0, 9, "IceCream");
    qmlRegisterType<Bread>("Bread", 0, 10, "Bread");
    qmlRegisterType<Coffee>("Coffee", 0, 11, "Coffee");
    qmlRegisterType<Alcohol>("Alcohol", 0, 12, "Alcohol");
    qmlRegisterType<CategoryCombobox>("CategoryCombobox", 0, 13, "CategoryCombobox");
    //qmlRegisterType<BasketTable>("BasketTable", 0, 13, "BasketTable");

    QQmlApplicationEngine engine;
    BasketTable model_;
    ManegeProductTable model2_;
    MproductCombobox model3_;
    AddInventory model4_;
    Mproduct model5_;
    TrashNow model6_;

    engine.rootContext()->setContextProperty("myModel", &model_);
    engine.rootContext()->setContextProperty("myModel2", &model2_);
    engine.rootContext()->setContextProperty("myModel3", &model3_);
    engine.rootContext()->setContextProperty("myModel4", &model4_);
    engine.rootContext()->setContextProperty("myModel5", &model5_);
    engine.rootContext()->setContextProperty("myModel6", &model6_);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *item=engine.rootObjects().value(0);

    BasketTable NameObject;
    QObject::connect(item, SIGNAL(qmlSignal(QString)), &NameObject, SLOT(cppSlot(QString)));

    return app.exec();
}
