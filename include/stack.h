#ifndef STACK_H
#define STACK_H

#include "base.h"
#include <QObject>

class Stack : public QObject
{
    Q_OBJECT
public:
    explicit Stack(QObject *parent = nullptr);

    Base::eSuit getTrump() const;
    std::vector<Base::Card> takeTopCards(uint numberOfCards);
    std::vector<Base::Card>& getCards();

signals:

private:
    void createStack();
    void shuffleStack();
    void setTrump();

private:
    std::vector<Base::Card> m_cards;
    Base::eSuit m_trump;
};



#endif // STACK_H
