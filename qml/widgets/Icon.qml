import QtQuick 2.0
import QtQuick.Controls 2.12

Label {
    id: label
    property alias size: label.font.pixelSize
    property alias icon: label.text

    font.family: app.fontAwesomeFontLoader.name
    color: "grey"
    font.pixelSize: 15
}
