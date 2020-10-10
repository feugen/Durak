#ifndef PLAYERHANDLER_H
#define PLAYERHANDLER_H

#include "player.h"
#include <QObject>
#include <memory>

class PlayerHandler : public QObject
{
    Q_OBJECT
public:
    explicit PlayerHandler() = default;
    explicit PlayerHandler(uint numberOfPlayers, QObject *parent = nullptr);

    std::vector<std::unique_ptr<Player>>& getPlayerList();

signals:

private:
    std::vector<std::unique_ptr<Player>> m_playerList;

};

#endif // PLAYERHANDLER_H
