import QtQuick
import "../config"
import "../services"
import "components"


Rectangle {

    width: Theme.controlPanelWidth
    height: Theme.controlPanelHeight


    color: Theme.background


    border {
        width: Theme.borderWidth
        color: Theme.accent
    }



    Grid {

        anchors.fill: parent

        anchors {
            topMargin: 40
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
        }


        columns: 2

        columnSpacing: Theme.rowSpacing
        rowSpacing: Theme.rowSpacing



        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: ""   // nf-dev-antdesign

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

   Select {

    text: "SYSTEM"

    options: [
        "IDLE",
        "LOCK",
        "REBOOT",
        "POWEROFF"
    ]

    selected: "IDLE"

    defaultSelection: "IDLE"

    resetAfterSelect: true


    onOptionSelected: function(value) {

        SystemActions.execute(value)

    }

}


        //powerprofile
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: ""   // nf-fae-plant

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }
Select {

    text: "BATTERY PROFILE"

    options: AsusProfile.profiles

    selected: AsusProfile.batteryProfile

    onOptionSelected: function(value) {
        AsusProfile.set(value)
    }

}




        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: ""   // nf-fa-wifi

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

      WifiSelect {}



        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: "󰂯"   // nf-md-bluetooth

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

        Select {
            text: "CONNECT DEVICE"
        }



        //microphone
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: "󰍬"   // nf-md-microphone

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

       Slider {

            width: Theme.sliderWidth

            value: Microphone.value


            onMoved: function(value) {

                Microphone.set(value)

            }

        }

        //volume
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: "󰕾"   // nf-md-volume_high

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

        Slider {
            width: Theme.sliderWidth

            value: Volume.value


            onMoved: function(value) {

                Volume.set(value)

            }

        }

        //brightness
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: "󰃠"   // nf-md-brightness_6

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

        Slider {

            width: Theme.sliderWidth

            value: Brightness.value

            onMoved: function(value) {

                Brightness.set(value)

            }

        }


        //temperature
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: ""   // nf-fa-temperature_empty

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

       Slider {

            width: Theme.sliderWidth

            value: ScreenTemperature.value


            onMoved: function(value) {

                ScreenTemperature.set(value)

            }
        }


        // notification volume
        Item {
            width: Theme.controlIconWidth
            height: Theme.controlRowHeight

            Text {
                anchors.centerIn: parent

                text: ""   // nf-fa-bell_concierge

                color: Theme.accent

                font {
                    family: Theme.iconFontFamily
                    pixelSize: Theme.iconSize
                }
            }
        }

        Slider {
            width: Theme.sliderWidth
            value: 50
        }

    }

}