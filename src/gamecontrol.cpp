#include "gamecontrol.h"

GameControl::GameControl(QObject *parent) : QObject(parent)
{

}

void GameControl::startGame()
{
    m_pPlayerHandler = std::make_unique<PlayerHandler>(m_Settings.getPlayerCount());
    m_Ai.setDifficulty(m_Settings.getDifficultyLevel());
    //todo
}
