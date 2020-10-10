#ifndef STEPCONTROL_H
#define STEPCONTROL_H

#include <QObject>

class StepControl : public QObject
{
    Q_OBJECT
public:
    explicit StepControl(QObject *parent = nullptr);

signals:

};

#endif // STEPCONTROL_H
