import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

import "../widgets"
import "../"

Rectangle {
    id: root
    width: 340
    height: app.height
    color: "#17212b"

    Rectangle {
        id: header
        color: "#17212b"
        height: 67
        width: root.width
        anchors.top: parent.top

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12

            Rectangle { // menu Button for opening drawer
                color: "transparent"
                radius: height/2
                Layout.fillHeight: true
                Layout.preferredWidth: height

                Icon {
                    id: menuIcon
                    anchors.centerIn: parent
                    icon: "\uf0c9"
                    size: 22
                    color: "#55616b"
                }

                MouseArea {
                    id: menuBtnMA
                    anchors.fill: parent
                    onClicked: { leftDrawer.open() }

                    onPressed: { parent.color= "#242f3d"; menuIcon.color="#fff"; }
                    onReleased: { parent.color= "transparent"; menuIcon.color="#55616b"; }
                }
            }

            TextField {
                placeholderText: qsTr("Search")
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#fff"
                font.pixelSize: 16
                background: Rectangle {
                    color: "#242f3d"
                    radius: 5
                }
            }
        }
    }

    Item {
        id: chats
        width: root.width
        anchors.top: header.bottom
        anchors.bottom: parent.bottom

        ListView {
            id: chatsListView
            anchors.fill: parent
            spacing: 0
            model: mockdata.chatsModel
            currentIndex: -1
            clip: true
            delegate: ChatlistDelegate {
                width: chatsListView.width
                height: 80

                chatId: uid
                source: chatIcon
                type: chatType
                name: chatName
                lastText: chatLastMessage
                unreadBadgeCount: 0
                isPinnedChat: false
                lastTextDate: chatLastTextDate
                isSelected: index === chatsListView.currentIndex

                onClicked: {
                    chatsListView.currentIndex = index

                    // Open the chats
                }
            }
        }
    }

    LeftDrawer {
        id: leftDrawer
    }

    MockData {
        id: mockdata
    }
}
