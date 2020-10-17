import QtQuick 2.0
import QtQuick.Layouts 1.15

Rectangle {
    property int areaHeight: 146
    property int cardHeight: 132
    property int cardWidth: 94

    id: cardArea
    width: layoutItem.width + (cardArea.border.width + layoutItem.anchors.leftMargin)*2
    height: areaHeight

    color: "white"
    border.color: "black"
    border.width: 1

    property bool human: false

    RowLayout{
        id: layoutItem
        spacing: 2
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 4
        }
        Repeater{
            id: cardList
            model: 6
            Rectangle{
                id: rect
                width: cardWidth; height: cardHeight
                border.width: 2
                border.color: "black"
                property bool dragable: true

                //https://stackoverflow.com/questions/30981404/qml-drag-and-drop-free-positioning/30991733

                property var cardId: [0] //connect to model?

                Drag.active: mouseArea.drag.active
                Drag.keys: cardId

                property point beginDrag
                property point endDrag
                property bool caught: false

                onCaughtChanged: {
                    if(caught){
                        console.log("Caught changed to true")
                        rect.border.color = "green"
                    }
                    else{
                        console.log("Caught changed to false")
                        rect.border.color = "black"
                    }
                }

                MouseArea{
                    id: mouseArea
                    enabled: human
                    anchors.fill: parent
                    drag.target: parent
                    onPressed: {
                        if(!backAnim.running && rect.dragable){
                            rect.beginDrag = Qt.point(rect.x, rect.y)
                        }
                    }

                    onReleased: {
                        if(!rect.caught || !rect.dragable) {
                            console.log("Old position")
                            backAnimX.from = rect.x;
                            backAnimX.to = beginDrag.x;
                            backAnimY.from = rect.y;
                            backAnimY.to = beginDrag.y;
                            backAnim.start()
                        }
                        else{
                            if(rect.dragable){
                                parent.Drag.drop()
                                console.log("New position")
                                rect.x = endDrag.x
                                rect.y = endDrag.y
                                console.log("x:" + rect.x + " y: " + rect.y)
                                rect.dragable = false
                                mouseArea.enabled = false
                            }
                        }
                    }
                }
                ParallelAnimation {
                    id: backAnim
                    SpringAnimation { id: backAnimX; target: rect; property: "x"; duration: 500; spring: 2; damping: 0.2 }
                    SpringAnimation { id: backAnimY; target: rect; property: "y"; duration: 500; spring: 2; damping: 0.2 }
                }
            }
        }
    }
}
