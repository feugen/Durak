#ifndef PLAYINGFIELD_H
#define PLAYINGFIELD_H

#include <QObject>

class PlayingField : public QObject
{
    Q_OBJECT
public:
    explicit PlayingField(QObject *parent = nullptr);

signals:

};

#endif // PLAYINGFIELD_H
