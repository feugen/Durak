#include "player.h"

Player::Player(uint playerId, QObject *parent) : QObject(parent),
  m_playerId(playerId)
{

}

void Player::setCards(std::vector<Base::Card> cards)
{
    m_cards = cards;
    m_numberOfCards = m_cards.size();
}

void Player::moveCard(const Base::Card& card)
{
    std::vector<Base::Card>::iterator it = std::find(m_cards.begin(), m_cards.end(), card);
    if (it != m_cards.end())
    {
        const auto index = std::distance(m_cards.begin(), it);
        m_cards.erase(m_cards.begin() + index);
        m_numberOfCards--;
    }
}

void Player::setWin()
{
    m_win = true;
}

void Player::setLose()
{
    m_lose = true;
}
