import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "src/qml"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Durak")

    property var numberOfPLayers: 2

    Rectangle{
        id: topMenu
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: (parent.width - layoutItemTop.width)/2
        }
        RowLayout{
            id: layoutItemTop
            Menu{
                id: menuItem
                onDifficultyChanged: {
                    GameControl.difficultyLevel = value
                }
                onPlayerNumberChanged: {
                    GameControl.playerCount = value
                    numberOfPLayers = value
                }
                onStartGame: {
                    GameControl.startGame(value)
                    controllItem.gameIsRunning = value
                }
            }
            Info{
                id: infoItem
                width: 200
            }
        }
    }

    PlayingField{
        id:playingField
        Rectangle{
            id: stackArea
            readonly property real multiplicator: 1.4
            width: cardAreaItem0.height * multiplicator; height: cardAreaItem0.height * multiplicator
            anchors{
                centerIn: parent
            }
            border.color: "black"
            Rectangle{
                id: trumpArea
                height: cardAreaItem0.cardWidth; width: cardAreaItem0.cardHeight
                anchors{
                    centerIn: parent
                }
                border.color: "black"

                Rectangle{
                    id: stack
                    height: cardAreaItem0.cardHeight; width: cardAreaItem0.cardWidth
                    anchors{
                        left: trumpArea.left
                        leftMargin: -20
                        verticalCenter: trumpArea.verticalCenter
                    }
                    border.color: "black"

                    Text {
                        id: stackCount
                        property int cardNumber: 0
                        anchors{
                            centerIn: parent
                        }
                        text: cardNumber
                        font.pointSize: 28
                        font.weight: Font.Thin
                    }
                }
            }
        }
    }

    Rectangle{
        id: player0
        anchors{
            bottom: parent.bottom
            bottomMargin: menuRectangle.height + menuRectangle.anchors.bottomMargin + layoutItemCardArea0.height + 10
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: - layoutItemCardArea0.width/2
        }
        RowLayout{
            id: layoutItemCardArea0
            CardArea{
                id: cardAreaItem0
                human: true
            }
        }
    }

    Rectangle{
        id: player1
        anchors{
            top: parent.top
            topMargin: layoutItemTop.height + topMenu.anchors.topMargin + 10
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: - layoutItemCardArea1.width/2
        }
        RowLayout{
            id: layoutItemCardArea1
            CardArea{
                id: cardAreaItem1
            }
        }

        Rectangle{
            id: player2
            visible: numberOfPLayers >= 3
            anchors{
                left: player1.left
                leftMargin: 0
                top: player1.bottom
                topMargin: layoutItemCardArea1.height
            }
            RowLayout{
                id: layoutItemCardArea2
                CardArea{
                    id: cardAreaItem2
                    transform: Rotation{origin.x: 0; origin.y: 0; angle: 90}
                }
            }
        }
        Rectangle{
            id: player3
            visible: numberOfPLayers >= 4
            anchors{
                right: player1.right
                rightMargin: 0
                top: player1.bottom
                topMargin: layoutItemCardArea1.height
            }
            RowLayout{
                id: layoutItemCardArea3
                CardArea{
                    id: cardAreaItem3
                    transform: Rotation{origin.x: cardAreaItem3.width; origin.y: 0; angle: -90}
                }
            }
        }
    }

    Rectangle{
        id: menuRectangle
        anchors{
            bottom: parent.bottom
            bottomMargin: 10 + layoutItemBottom.height
            left: parent.left
            leftMargin: (parent.width - layoutItemBottom.width)/2
        }
        RowLayout{
            id: layoutItemBottom
            TurnControl{
                id: controllItem
            }
        }
    }
}
