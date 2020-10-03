import QtQuick 2.0
import QtQuick.Layouts 1.15

Rectangle{
    id: info
    width: 200
    height: 40

    color: "white"
    border.color: "black"
    border.width: 1

    Timer{
        //todo
    }

    RowLayout{
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 4
        }

        Text {
            text: qsTr("Round: ")
            color: "black"
        }
        Text {
            text: qsTr("0")
            color: "black"
            Layout.preferredWidth: 20
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            text: qsTr("Time: ")
            color: "black"
        }
        Text {
            text: qsTr("0")
            color: "black"
            Layout.preferredWidth: 40
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
