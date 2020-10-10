import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: menu
    width: layoutItem.width + (menu.border.width + layoutItem.anchors.leftMargin)*2
    height: 40

    color: "white"
    border.color: "black"
    border.width: 1

    signal difficultyChanged(string value)
    signal playerNumberChanged(string value)
    signal startGame()

    RowLayout{
        id: layoutItem
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 4
        }

        Text{
            id: difficultyTextItem
            text: qsTr("Difficulty: ")
        }
        ComboBox{
            id: difficultyComboBox
            model: [ "Easy", "Medium", "Hard" ]
            style: ComboBoxStyle {
                textColor: "black"
            }
            onCurrentTextChanged: difficultyChanged(difficultyComboBox.currentText)
        }
        Text{
            id: numberOfPlayersTextItem
            text: qsTr("Players: ")
        }
        ComboBox{
            id: numberOfPlayersComboBox
            model: [ "2", "3", "4" ]
            style: ComboBoxStyle {
                textColor: "black"
            }
            onCurrentTextChanged: playerNumberChanged(numberOfPlayersComboBox.currentText)
        }
        Button{
            id: startButton
            Layout.preferredWidth: 100
            style: ButtonStyle{
                label: Text {
                    color: "black"
                    text: "Start game"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: startGame()
        }
    }
}
