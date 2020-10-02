#include "cards.h"
#include <QMetaEnum>

#include <algorithm>
#include <random>

Cards::Cards(QObject *parent) : QObject(parent)
{
    createCards();
    shuffleCards();
    setTrump();
}

void Cards::createCards()
{
    const QMetaEnum rank = QMetaEnum::fromType<Base::eRank>();
    const QMetaEnum suit = QMetaEnum::fromType<Base::eSuit>();

    for (int i = 0; i < rank.keyCount(); i++)
    {
        for (int j = 0; j < suit.keyCount(); j++)
        {
            const auto rankItem = static_cast<Base::eRank>(rank.value(i));
            const auto suitItem = static_cast<Base::eSuit>(suit.value(j));
            Base::Card card;
            card.rank = rankItem;
            card.suit = suitItem;
            m_cards.push_back(card);
        }
    }
}

void Cards::shuffleCards()
{
    auto rd = std::random_device {};
    auto rng = std::default_random_engine { rd() };
    std::shuffle(std::begin(m_cards), std::end(m_cards), rng);
}

void Cards::setTrump()
{
    std::rotate(m_cards.rbegin(), m_cards.rbegin() + 1, m_cards.rend());
    m_trump = m_cards.at(0).suit;
}

Base::eSuit Cards::getTrump() const
{
    return m_trump;
}

std::vector<Base::Card> Cards::getTopCards(uint numberOfCards)
{
    if(m_cards.size() < numberOfCards) return {};

    std::vector<Base::Card> result;
    for (uint i = 0; i < numberOfCards; i++)
    {
        result.push_back(m_cards.at(m_cards.size()-1));
        m_cards.pop_back();
    }
    return result;
}


