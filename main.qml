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

    Component.onCompleted: layoutItem.disableUnuseableCardSinks()

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
        GridLayout{
            id: layoutItem
            readonly property var unuseableCards: [6, 7, 8, 11, 12, 13]
            columns: 5
            rows: 3
            columnSpacing: 15
            anchors{
                centerIn: parent
            }
            function disableUnuseableCardSinks()
            {
                for (var card in layoutItem.unuseableCards){
                    cardSink.itemAt(layoutItem.unuseableCards[card]).border.color = "transparent";
                    cardSink.itemAt(layoutItem.unuseableCards[card]).color = "transparent";
                    cardSink.itemAt(layoutItem.unuseableCards[card]).useableField = false;
                }
            }

            Repeater{
                id: cardSink
                model: 20
                Rectangle{
                    id: rect
                    width: cardAreaItem0.cardWidth; height: cardAreaItem0.cardHeight
                    border.width: 2
                    border.color: "black"
                    color: "lightgrey"

                    property bool useableField: true
                    property bool bidMode: false
                    property int offsetDrop: bidMode ? 10 : 0

                    //https://stackoverflow.com/questions/30981404/qml-drag-and-drop-free-positioning/30991733

                    DropArea{
                        id: dragTarget
                        anchors.centerIn: parent
                        width: parent.width; height: parent.height
                        property bool empty: true

                        property var cardId: [0] //connect to model
                        keys: [dragTarget.cardId]

                        onEntered: {
                            console.log("Entered");
                            if(dragTarget.empty && useableField){
                                drag.source.caught = true;
                                rect.border.color = "green"
                            }
                        }
                        onExited: {
                            if(dragTarget.empty && useableField){
                                console.log("Exit");
                                drag.source.caught = false;
                                rect.border.color = "black"
                            }
                        }
                        onDropped: {
                            if(useableField){
                                console.log("Dropped");
                                drag.source.endDrag = Qt.point(rect.x - rect.offsetDrop, rect.y + rect.offsetDrop - playingField.height)
                                dragTarget.empty = false
                            }
                        }
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
