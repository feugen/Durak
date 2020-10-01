#ifndef CARDS_H
#define CARDS_H

#include <QObject>

class Cards : public QObject
{
    Q_OBJECT
public:
    explicit Cards(QObject *parent = nullptr);

signals:

};

#endif // CARDS_H
