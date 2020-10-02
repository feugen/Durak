#ifndef GAMECONTROL_H
#define GAMECONTROL_H

#include <QObject>

class GameControl : public QObject
{
    Q_OBJECT
public:
    explicit GameControl(QObject *parent = nullptr);

signals:

};

#endif // GAMECONTROL_H
