#ifndef GAMECONTROL_H
#define GAMECONTROL_H

#include "playerhandler.h"
#include "table.h"
#include "settings.h"
#include "stepcontrol.h"
#include "ai.h"
#include <QObject>

class GameControl : public QObject
{
    Q_OBJECT
public:
    explicit GameControl(QObject *parent = nullptr);

    Q_PROPERTY(QVariant playerCount WRITE setPlayerCount NOTIFY playerCountChanged)
    Q_PROPERTY(QVariant difficultyLevel WRITE setDifficultyLevel NOTIFY difficultyLevelChanged)

    Q_INVOKABLE void startGame(bool gameState);

    uint getPlayerCount() const;
    QString getDifficultyLevel() const;

public slots:
    void setPlayerCount(QVariant playerCount);
    void setDifficultyLevel(QVariant difficultyLevel);

signals:
    void playerCountChanged(QVariant playersCount);
    void difficultyLevelChanged(QVariant difficultyLevel);

private:
    std::unique_ptr<Settings> m_pSettings = nullptr;
    std::unique_ptr<PlayerHandler> m_pPlayerHandler = nullptr;
    std::unique_ptr<StepControl> m_pStepControl = nullptr;
    Table m_Table;
    Ai m_Ai;

signals:

};

#endif // GAMECONTROL_H
