#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{

}

uint Settings::getPlayerCount() const
{
    return m_playerCount;
}

QString Settings::getDifficultyLevel() const
{
    return m_difficultyLevel;
}

void Settings::setPlayerCount(QVariant playerCount)
{
    if(playerCount.canConvert<uint>())
    {
        bool ok = false;
        const auto result = playerCount.toUInt(&ok);
        if (m_playerCount == result)
            return;
        m_playerCount = result;
    }
}

void Settings::setDifficultyLevel(QVariant difficultyLevel)
{
    if (difficultyLevel.canConvert<QString>())
    {
        const auto result = difficultyLevel.toString();
        if(m_difficultyLevel == result)
            return;
        m_difficultyLevel = result;
    }
}
