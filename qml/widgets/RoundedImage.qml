import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 50
    height: 50
    visible: true

    property alias source: img.source

    Image {
        id: img
        width: root.width
        height: width
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
    }

    Rectangle {
        id: mask
        width: root.width
        height: width
        radius: height/2
        visible: false
    }
}
