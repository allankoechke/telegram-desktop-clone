import QtQuick 2.15
import QtQuick.Window 2.15

import "./components"


Window {
    id: app
    minimumHeight: 595
    minimumWidth: 475
    width: 1280
    height: 720
    visible: true
    color: isDarkTheme ? "#0e1621":"#fff"
    title: qsTr("Telegram Clone")

    property bool isDarkTheme: true
    property alias fontAwesomeFontLoader: fontAwesomeFontLoader

    Row {
        anchors.fill: parent

        LeftPanel {
id: leftPanel
        }

        ChatViewPanel {
            id: chatViewPanel
            width: app.width - leftPanel.width
            height: app.height

        }
    }


    FontLoader {
        id: fontAwesomeFontLoader
        source: "qrc:/assets/fonts/fontawesome.otf"
    }
}
