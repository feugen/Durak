#ifndef PLAYERHANDLER_H
#define PLAYERHANDLER_H

#include <QObject>

class PlayerHandler : public QObject
{
    Q_OBJECT
public:
    explicit PlayerHandler(QObject *parent = nullptr);

signals:

};

#endif // PLAYERHANDLER_H
