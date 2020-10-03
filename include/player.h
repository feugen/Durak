#ifndef PLAYER_H
#define PLAYER_H

#include "base.h"
#include <QObject>

class Player : public QObject
{
    Q_OBJECT
public:
    explicit Player() = default;
    explicit Player(uint playerId, QObject *parent = nullptr);

    void setCards(std::vector<Base::Card> cards);
    void moveCard(const Base::Card &card);
    void setWin();
    void setLose();

private:
    uint m_playerId;
    ulong m_numberOfCards;
    bool m_inPlay = true;
    bool m_win = false;
    bool m_lose = false;
    std::vector<Base::Card> m_cards;

signals:

};

#endif // PLAYER_H
