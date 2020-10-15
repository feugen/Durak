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
                border.width: 1
                border.color: "black"

                //https://stackoverflow.com/questions/30981404/qml-drag-and-drop-free-positioning/30991733

                Drag.active: mouseArea.drag.active
                property point beginDrag
                property bool caught: false

                MouseArea{
                    id: mouseArea
                    enabled: human
                    anchors.fill: parent
                    drag.target: parent
                    onPressed: {
                        if(!backAnim.running){
                            rect.beginDrag = Qt.point(rect.x, rect.y)
                        }
                    }
                    onReleased: {
                        if(!rect.caught) {
                            backAnimX.from = rect.x;
                            backAnimX.to = beginDrag.x;
                            backAnimY.from = rect.y;
                            backAnimY.to = beginDrag.y;
                            backAnim.start()
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
