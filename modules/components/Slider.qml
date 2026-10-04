import QtQuick
import "../../config"


Item {

    property real value: 50

    signal moved(real value)


    height: Theme.controlRowHeight
    width: parent.width



    function updateValue(x) {

        moved(
            Math.max(
                0,
                Math.min(
                    100,
                    x / sliderBackground.width * 100
                )
            )
        )

    }



    Rectangle {

        id: sliderBackground


        anchors.centerIn: parent


        width: parent.width
        height: 35


        color: Theme.background


        border {
            width: Theme.borderWidth
            color: Theme.accent
        }



        Rectangle {

            id: fillBorder


            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom

                margins: 2
            }


            width: (parent.width - 4) * (value / 100)


            color: Theme.background



            Rectangle {

                anchors {
                    fill: parent

                    margins: 3
                }


                color: Theme.accent

            }

        }



        Text {

            anchors.centerIn: parent


            text: Math.round(value) + "%"


            font {
                family: Theme.fontFamily
                pixelSize: Theme.fontSize
                weight: Font.Bold
            }


            color: {

                if (value <= 45)
                    return Theme.accent


                if (value >= 60)
                    return Theme.background


                let t = (value - 45) / 15


                return Qt.rgba(
                    Theme.accent.r + (Theme.background.r - Theme.accent.r) * t,
                    Theme.accent.g + (Theme.background.g - Theme.accent.g) * t,
                    Theme.accent.b + (Theme.background.b - Theme.accent.b) * t,
                    1
                )

            }

        }



        MouseArea {

            anchors.fill: parent


            onPressed: function(mouse) {

                updateValue(mouse.x)

            }


            onPositionChanged: function(mouse) {

                if (pressed) {

                    updateValue(mouse.x)

                }

            }

        }

    }

}