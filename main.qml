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

    Rectangle{
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
            }
            Info{
                id: infoItem
                width: 200
            }
        }
    }

    Rectangle{
        anchors{
            bottom: parent.bottom
            bottomMargin: menuRectangle.height + menuRectangle.anchors.bottomMargin + layoutItemCardArea.height + 10
            left: parent.left
            leftMargin: (parent.width - layoutItemCardArea.width)/2
        }
        RowLayout{
            id: layoutItemCardArea
            CardArea{
                id: cardAreaItem
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
