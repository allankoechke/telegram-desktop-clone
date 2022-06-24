import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import "../widgets"


Drawer {
    id: drawer
    edge: Qt.LeftEdge
    height: app.height
    width: 340

    property bool addNewAccountVisible: false

    RotationAnimation {
        target: collapseIcon
        from: 0; to: 180
        running: addNewAccountVisible
        loops: 1
        duration: 300
    }

    RotationAnimation {
        target: collapseIcon
        from: 180; to: 0
        running: !addNewAccountVisible
        loops: 1
        duration: 300
    }

    background: Rectangle {
        id: bg
        color: '#17212b'
    }

    contentItem: Item {

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // Header Item
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 165
                height: 165
                width: parent.width

                Rectangle {
                    width: parent.width
                    height: 1
                    color: Qt.rgba(0,0,0,0.3)
                    anchors.bottom: parent.bottom
                }

                Item {
                    id: imgContainer
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 100
                    anchors.leftMargin: 30

                    RoundedImage {
                        source: "qrc:/assets/images/user"
                        width: 60
                        height: 60
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Item {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: imgContainer.bottom

                    Item {
                        anchors.fill: parent
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30
                        anchors.topMargin: 10


                        AppLabel {
                            id: lbl
                            text: qsTr("John Doe")
                            color: "#eee"
                            fontSize: 16
                            fontWeight: Font.Medium
                        }

                        Item {
                            anchors.top: lbl.bottom
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right

                            AppLabel {
                                text: qsTr("+25X 70X 3X7 92X")
                                color: "#5a6c7e"
                                fontSize: 14
                                fontWeight: Font.Medium
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                            }

                            Icon {
                                id: collapseIcon
                                icon: "\uf107"
                                color: "#5a6c7e"
                                size: 24
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: addNewAccountVisible = !addNewAccountVisible
                    }
                }
            }

            Item {
                id: addUserItem
                Layout.fillWidth: true
                Layout.preferredHeight: -1
                implicitHeight: addNewAccountVisible ? 60:0
                visible: addNewAccountVisible

                Behavior on height { NumberAnimation { duration: 500 } }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: Qt.rgba(0,0,0,0.3)
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -height
                }

                MenuButton {
                    anchors.verticalCenter: parent.verticalCenter
                    iconBg: "#5288c1"
                    icon: "+"
                    label: qsTr("Add Account")
                    iconBgItem {
                        width: 24
                        radius: 12
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: 10

                Column {
                    anchors.fill: parent

                    MenuButton {
                        iconBg: "#56b3f5"
                        icon: "\uf500"
                        label: "New Group"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#ed9f20"
                        icon: "\uf0a1"
                        label: "New Channel"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#f06964"
                        icon: "\uf007"
                        label: "Contacts"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#6dc534"
                        icon: "\uf095"
                        label: "Calls"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#7595ff"
                        icon: "\uf02e"
                        label: "Saved Messages"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#7595ff"
                        icon: "\uf013"
                        label: "Settings"

                        onClicked: {
                            drawer.close()
                        }
                    }

                    MenuButton {
                        iconBg: "#7595ff"
                        icon: "\uf186"
                        label: "Night Mode"
                        showToggle: true
                        toggled: app.isDarkTheme

                        onClicked: {
                            app.isDarkTheme = !app.isDarkTheme
                            drawer.close()
                        }
                    }
                }
            }

            // Footer section for the general info
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.margins: 30

                Column {
                    anchors.fill: parent
                    spacing: 5

                    AppLabel {
                        text: qsTr("Telegram Desktop")
                        fontWeight: Font.Medium
                        fontSize: 18
                        color: "#5a6c7e"
                    }

                    AppLabel {
                        text: qsTr("Version 4.0 - About")
                        fontWeight: Font.Medium
                        fontSize: 16
                        color: "#5a6c7e"
                    }
                }
            }
        }
    }
}
