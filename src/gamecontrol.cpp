#include "gamecontrol.h"

GameControl::GameControl(QObject *parent) : QObject(parent),
    m_pSettings(std::make_unique<Settings>())
  , m_pPlayerHandler(std::make_unique<PlayerHandler>())
  , m_pStepControl(std::make_unique<StepControl>())
{
}


uint GameControl::getPlayerCount() const
{
    return m_pSettings->getPlayerCount();
}

QString GameControl::getDifficultyLevel() const
{
    return m_pSettings->getDifficultyLevel();
}

void GameControl::setPlayerCount(QVariant playerCount)
{
    m_pSettings->setPlayerCount(playerCount);
    emit playerCountChanged(playerCount);
}

void GameControl::setDifficultyLevel(QVariant difficultyLevel)
{
    m_pSettings->setDifficultyLevel(difficultyLevel);
    emit difficultyLevelChanged(difficultyLevel);
}


void GameControl::startGame()
{
    const auto playerCount = m_pSettings->getPlayerCount();
    const auto difficultyLevel = m_pSettings->getDifficultyLevel();
    m_pPlayerHandler = std::make_unique<PlayerHandler>(playerCount);
    m_Ai.setDifficulty(difficultyLevel);
    //todo
}
