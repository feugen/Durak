#include "playerhandler.h"

PlayerHandler::PlayerHandler(uint numberOfPlayers, QObject *parent) : QObject(parent)
{
    for (uint i = 0; i < numberOfPlayers; i++)
    {
        m_playerList.push_back(std::make_unique<Player>(i));
    }
}

std::vector<std::unique_ptr<Player> > &PlayerHandler::getPlayerList()
{
    return m_playerList;
}
