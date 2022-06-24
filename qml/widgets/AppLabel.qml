import QtQuick 2.0
import QtQuick.Controls 2.12

Label {
    id: label
    color: "#fff"
    font.pixelSize: 14

    property alias fontSize: label.font.pixelSize
    property alias fontWeight: label.font.weight
    property alias isBold: label.font.bold
    property alias isItalic: label.font.italic
    property alias isUnderlined: label.font.underline
}
