import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "src/qml"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: (parent.width - layoutItem.width)/2
        }

        RowLayout{
            id: layoutItem
            Menu{
                id: menuItem
                width: 600
            }
            Info{
                id: infoItem
                width: 200
            }
        }
    }
}
