#ifndef TABLE_H
#define TABLE_H

#include "stack.h"
#include "playingfield.h"
#include <QObject>

class Table : public QObject
{
    Q_OBJECT
public:
    explicit Table(QObject *parent = nullptr);

    Stack& getStack();
    PlayingField& getPlayingField();

signals:

private:
    Stack m_stack;
    PlayingField m_playingField;
};

#endif // TABLE_H
