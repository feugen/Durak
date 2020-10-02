#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT

public:
    explicit Settings(QObject *parent = nullptr);

    Q_PROPERTY(int playersCount READ getPlayerCount WRITE setPlayerCount NOTIFY playerCountChanged)
    Q_PROPERTY(QString difficultyLevel READ getDifficultyLevel WRITE setDifficultyLevel NOTIFY difficultyLevelChanged)

    int getPlayerCount() const;
    QString getDifficultyLevel() const;

public slots:
    void setPlayerCount(int playersCount);
    void setDifficultyLevel(QString difficultyLevel);

signals:
    void playerCountChanged(int playersCount);
    void difficultyLevelChanged(QString difficultyLevel);

private:
    int m_playersCount;
    QString m_difficultyLevel;
};

#endif // SETTINGS_H
