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

    Q_INVOKABLE void startGame();

private:
    std::unique_ptr<PlayerHandler> m_pPlayerHandler = nullptr;
    Table m_Table;
    Settings m_Settings;
    StepControl m_StepControl;
    Ai m_Ai;

signals:

};

#endif // GAMECONTROL_H
