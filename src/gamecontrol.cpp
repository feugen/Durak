#include "gamecontrol.h"

GameControl::GameControl(QObject *parent) : QObject(parent)
{

}

void GameControl::startGame()
{
    bool ok = false;
    const auto numberOfPlayers = m_Settings.getPlayerCount().toUInt(&ok);
    if(ok)
    {
        m_pPlayerHandler = std::make_unique<PlayerHandler>(numberOfPlayers);
    }
    m_Ai.setDifficulty(m_Settings.getDifficultyLevel().toString());
    //todo
}
