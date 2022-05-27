QT += quick sql charts

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        alcohol.cpp \
        bread.cpp \
        categorytable.cpp \
        chocolate.cpp \
        coffee.cpp \
        icecream.cpp \
        main.cpp \
        manegeproducttable.cpp \
        producttable.cpp \
        ramen.cpp \
        snack.cpp \
        sqlquerymodel.cpp \
        tablemodel.cpp \
        water.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    alcohol.h \
    bread.h \
    categorytable.h \
    chocolate.h \
    coffee.h \
    icecream.h \
    manegeproducttable.h \
    producttable.h \
    ramen.h \
    snack.h \
    sqlquerymodel.h \
    tablemodel.h \
    water.h
