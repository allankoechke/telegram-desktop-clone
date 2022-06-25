import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    color: isSelected ? "#2b5278" : internal.bgColor


    property int chatId
    property string source: ""
    property string type: "group"
    property string name: "Awesome Members Group"
    property string lastText: "Welcome all members to this community."
    property int unreadBadgeCount: 0
    property bool isPinnedChat: false
    property string lastTextDate: "Fri"
    property bool isSelected: false

    signal clicked()


    QtObject {
        id: internal

        property string bgColor: "transparent"
        property var chatIconType: { 'group': "\uf500", 'chat': "", 'channel': "\uf0a1" }
        property var colors: ["green", "blue", "teal", "orange", "pink", 'maroon']

        function getColor() {
            return colors[Math.floor(Math.random() * 5)];
        }

        function getText(name) {
            return name[0].toUpperCase() + name.split(' ')[1][0].toUpperCase()
        }
    }

    Item {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 10
        anchors.bottomMargin: 10

        RowLayout {
            anchors.fill: parent
            spacing: 20

            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: height
                radius: height/2
                color: internal.getColor()

                AppLabel {
                    text: internal.getText(name)
                    fontSize: 20
                    isBold: true
                    anchors.centerIn: parent
                    color: 'white'
                    visible: source ===""
                }

                RoundedImage {
                    id: img
                    source: root.source
                    anchors.centerIn: parent
                    anchors.fill: parent
                    visible: source !==""
                    image.fillMode: Image.PreserveAspectFit
                }
            }

            Item {
                id: topChatDataItem
                Layout.fillHeight: true
                Layout.fillWidth: true

                Column {
                    spacing: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    Row {

                        Icon {
                            id: chatTypeIcon
                            visible: type !== "chat"
                            icon: internal.chatIconType[type]
                            size: 12
                            color: "#fff"
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Icon.AlignVCenter
                        }

                        AppLabel {
                            id: _name
                            width: type==="chat" ? (topChatDataItem.width - _date.width) : (topChatDataItem.width - _date.width - chatTypeIcon.width)
                            text: name
                            elide: "ElideRight"
                            fontSize: 16
                            fontWeight: Font.Medium
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: type==="chat" ? 0 : 10
                            rightPadding: 20
                        }

                        AppLabel {
                            id: _date
                            text: lastTextDate
                            fontSize: 16
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    AppLabel {
                        id: _lastText
                        text: lastText
                        color: isSelected ? "#fff" : "gray"
                        fontSize: 14
                        width: parent.width
                        elide: "ElideRight"
                        rightPadding: unreadBadgeCount>0 ? 20 : 0

                        AppLabel {
                            text: unreadBadgeCount
                            fontSize: 14
                            anchors.right: parent.right
                            visible: unreadBadgeCount>0
                            padding: 5
                            color: "#fff"
                            anchors.verticalCenter: parent.verticalCenter
                            background: Rectangle {
                                color: "#4082bc"
                                width: height
                                radius: height/2
                            }
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
        onHoveredChanged: {
            if(ma.pressed) {
                internal.bgColor = pressed ? "#242f3d":"transparent"
            } else {
                internal.bgColor = containsMouse ? "#242f3d":"transparent"
            }
        }
    }
}
