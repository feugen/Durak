#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{

}

int Settings::getPlayerCount() const
{
    return m_playersCount;
}

QString Settings::getDifficultyLevel() const
{
    return m_difficultyLevel;
}

void Settings::setPlayerCount(int playersCount)
{
    if (m_playersCount == playersCount)
        return;

    m_playersCount = playersCount;
    emit playerCountChanged(m_playersCount);
}

void Settings::setDifficultyLevel(QString difficultyLevel)
{
    if (m_difficultyLevel == difficultyLevel)
        return;

    m_difficultyLevel = difficultyLevel;
    emit difficultyLevelChanged(m_difficultyLevel);
}
