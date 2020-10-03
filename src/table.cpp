#include "table.h"

Table::Table(QObject *parent) : QObject(parent)
{

}

Stack &Table::getStack()
{
    return m_stack;
}

PlayingField &Table::getPlayingField()
{
    return m_playingField;
}
