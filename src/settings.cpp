#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{

}

QVariant Settings::getPlayerCount() const
{
    return m_playersCount;
}

QVariant Settings::getDifficultyLevel() const
{
    return m_difficultyLevel;
}

//Should be QVariant
void Settings::setPlayerCount(QVariant playersCount)
{
    if (m_playersCount == playersCount)
        return;

    m_playersCount = playersCount;
    emit playerCountChanged(m_playersCount);
}

void Settings::setDifficultyLevel(QVariant difficultyLevel)
{
    if (m_difficultyLevel == difficultyLevel)
        return;

    m_difficultyLevel = difficultyLevel;
    emit difficultyLevelChanged(m_difficultyLevel);
}
