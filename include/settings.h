#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QVariant>

class Settings : public QObject
{
    Q_OBJECT

public:
    explicit Settings(QObject *parent = nullptr);

    Q_PROPERTY(QVariant playerCount READ getPlayerCount WRITE setPlayerCount NOTIFY playerCountChanged)
    Q_PROPERTY(QVariant difficultyLevel READ getDifficultyLevel WRITE setDifficultyLevel NOTIFY difficultyLevelChanged)

    QVariant getPlayerCount() const;
    QVariant getDifficultyLevel() const;

public slots:
    void setPlayerCount(QVariant playersCount);
    void setDifficultyLevel(QVariant difficultyLevel);

signals:
    void playerCountChanged(QVariant playersCount);
    void difficultyLevelChanged(QVariant difficultyLevel);

private:
    QVariant m_playersCount;
    QVariant m_difficultyLevel;
};

#endif // SETTINGS_H
