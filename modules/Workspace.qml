import QtQuick
import "../config"


Text {

    property bool active: false
    property bool occupied: false

    text: "/"

    font {
        family: Theme.fontFamily
        pixelSize: 20
        weight: Font.ExtraBold
    }

    color: active
        ? Theme.accent
        : occupied
            ? Theme.primary
            : Theme.secondary

}

