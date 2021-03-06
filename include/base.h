#ifndef BASE_H
#define BASE_H

#include <QMetaType>
#include <QMetaEnum>

class Base
{
    Q_GADGET

public:

    enum class eDifficulty
    {
        Easy = 0,
        Medium = 1,
        Hard = 2
    };
    Q_ENUM(eDifficulty)

    enum class eSuit
    {
        Diamond = 0,
        Club = 1,
        Heart = 2,
        Spade = 3
    };
    Q_ENUM(eSuit)

    enum class eRank
    {
        Six = 0,
        Seven = 1,
        Eight = 2,
        Nine = 3,
        Ten = 4,
        Jack = 5,
        Queen = 6,
        King = 7,
        Ace = 8
    };
    Q_ENUM(eRank)

    struct Card{
        eRank rank;
        eSuit suit;
        bool operator==(const Card& data)
        {
            return this->rank == data.rank && this->suit == data.suit;
        }
    };
};

Q_DECLARE_METATYPE(Base::eSuit)
Q_DECLARE_METATYPE(Base::eRank)

#endif // BASE_H
