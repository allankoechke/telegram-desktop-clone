import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id: btn
    height: 50
    width: 340
    color: internal.bgColor

    QtObject {
        id: internal
        property string bgColor: "transparent"
    }

    property alias iconBg: iconbg.color
    property alias icon: ico.icon
    property alias label: lbl.text
    property bool showToggle: false
    property bool toggled: false
    property alias iconBgItem: iconbg

    signal clicked()

    onToggledChanged: console.log("Toggle changed to: ", toggled)

    Item {
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.rightMargin: 30

        Item {
            id: iconContainer
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: 30
            height: 30

            Rectangle {
                id: iconbg
                anchors.centerIn: parent
                width: 30
                height: width
                color: iconBg
                radius: 5

                Icon {
                    id: ico
                    color: "#fff"
                    anchors.centerIn: parent
                }
            }
        }

        Item {
            id: labelContainer
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: iconContainer.right
            anchors.leftMargin: 20
            anchors.right: parent.right

            AppLabel {
                id: lbl
                color: "#fff"
                fontSize: 14
                anchors.verticalCenter: parent.verticalCenter
            }

            Switch {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                checked: toggled
                visible: showToggle
                icon.color: 'red'
            }
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        onClicked: btn.clicked()
        onHoveredChanged: {
            if(ma.pressed) {
                internal.bgColor = pressed ? "#242f3d":"transparent"
            } else {
                internal.bgColor = containsMouse ? "#242f3d":"transparent"
            }
        }
    }
}
