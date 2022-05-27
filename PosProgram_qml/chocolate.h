#ifndef CHOCOLATE_H
#define CHOCOLATE_H

#include <QObject>

class chocolate : public QObject
{
    Q_OBJECT
public:
    explicit chocolate(QObject *parent = nullptr);

signals:

};

#endif // CHOCOLATE_H
