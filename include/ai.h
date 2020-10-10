#ifndef AI_H
#define AI_H

#include "base.h"
#include <QObject>

class Ai : public QObject
{
    Q_OBJECT
public:
    explicit Ai(QObject *parent = nullptr);

    Base::eDifficulty getDifficulty() const;
    void setDifficulty(QString Difficulty);

private:
    Base::eDifficulty m_Difficulty = Base::eDifficulty::Easy;

signals:

};

#endif // AI_H
