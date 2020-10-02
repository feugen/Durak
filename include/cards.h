#ifndef CARDS_H
#define CARDS_H

#include "base.h"
#include <QObject>

class Cards : public QObject
{
    Q_OBJECT
public:
    explicit Cards(QObject *parent = nullptr);

    Base::eSuit getTrump() const;
    std::vector<Base::Card> getTopCards(uint numberOfCards);

signals:

private:
    void createCards();
    void shuffleCards();
    void setTrump();

private:
    std::vector<Base::Card> m_cards;
    Base::eSuit m_trump;
};



#endif // CARDS_H
