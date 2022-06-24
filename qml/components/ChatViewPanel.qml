import QtQuick 2.0
import "../widgets"


Item {

    Item {
        anchors.fill: parent

        AppLabel {
            text: qsTr("Select a chat to start messaging")
            anchors.centerIn: parent
            background: Rectangle {
                color: "#1e2c3a"
                radius: height/2
                anchors {
                    topMargin: -7
                    bottomMargin: -7
                    leftMargin: -15
                    rightMargin: -15
                }

                anchors.fill: parent
            }
        }
    }
}
