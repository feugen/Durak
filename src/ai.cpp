#include "ai.h"

Ai::Ai(QObject *parent) : QObject(parent)
{

}

Base::eDifficulty Ai::getDifficulty() const
{
    return m_Difficulty;
}

void Ai::setDifficulty(QString Difficulty)
{
    if(Difficulty == "Easy")
    {
        m_Difficulty = Base::eDifficulty::Easy;
    }
    else if(Difficulty == "Medium")
    {
        m_Difficulty = Base::eDifficulty::Medium;
    }
    else
    {
        m_Difficulty = Base::eDifficulty::Hard;
    }
}
