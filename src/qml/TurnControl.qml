import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: turnControl

    width: layoutItem.width + (turnControl.border.width + layoutItem.anchors.leftMargin)*2
    height: 40

    color: "white"
    border.color: "black"
    border.width: 1

    property bool gameIsRunning: false

    RowLayout{
        id: layoutItem
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 4
        }

        Text{
            text: qsTr("Turn: ")
        }
        Button{
            id: lastTurn
            enabled: false
            Layout.preferredWidth: 100
            style: ButtonStyle{
                label: Text {
                    color: lastTurn.enabled ? "black" : "grey"
                    text: qsTr("Last turn")
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        Button{
            id: nextTurn
            enabled: false
            Layout.preferredWidth: 100
            style: ButtonStyle{
                label: Text {
                    color: nextTurn.enabled ? "black" : "grey"
                    text: qsTr("Next turn")
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        Text{
            text: qsTr("Action: ")
        }
        ExclusiveGroup { id: tabPositionGroup }
        RadioButton {
            checked: true
            exclusiveGroup: tabPositionGroup
            style: RadioButtonStyle{
                label: Text{
                    color: "black";
                    text: qsTr("Decline cards")
                }
            }
        }
        RadioButton {
            exclusiveGroup: tabPositionGroup
            style: RadioButtonStyle{
                label: Text{
                    color: "black";
                    text: qsTr("Take cards")
                }
            }
        }
        Button{
            id: nextRound
            enabled: gameIsRunning
            Layout.preferredWidth: 100
            style: ButtonStyle{
                label: Text {
                    color: nextRound.enabled ? "black" : "grey"
                    text: qsTr("Next turn")
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
