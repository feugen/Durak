#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QVariant>

class Settings : public QObject
{
    Q_OBJECT

public:
    explicit Settings(QObject *parent = nullptr);

    uint getPlayerCount() const;
    QString getDifficultyLevel() const;
    void setPlayerCount(QVariant playerCount);
    void setDifficultyLevel(QVariant difficultyLevel);

private:
    uint m_playerCount;
    QString m_difficultyLevel;
};

#endif // SETTINGS_H
