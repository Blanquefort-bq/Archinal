import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../config"
import "../services"


PanelWindow {

    required property var modelData
    screen: modelData


    property string currentTime: Qt.formatTime(
        new Date(),
        "hh.mm"
    )



    function workspaceOccupied(id) {

        for (let i = 0; i < Hyprland.workspaces.values.length; i++) {

            let ws = Hyprland.workspaces.values[i]

            if (ws.id === id)
                return true
        }

        return false
    }



    WlrLayershell.layer: WlrLayer.Top



    anchors {

        top: true
        left: true
        right: true

    }



    margins {

        top: 10
        left: 10
        right: 10

    }



    implicitHeight: 40


    color: "transparent"



    Timer {

        interval: 1000

        running: true

        repeat: true


        onTriggered: {

            currentTime = Qt.formatTime(
                new Date(),
                "hh.mm"
            )

        }

    }



    Rectangle {

        anchors.fill: parent


        color: Theme.background


        border {

            width: Theme.borderWidth
            color: Theme.accent

        }



        Row {

            anchors {

                left: parent.left
                leftMargin: 50
                verticalCenter: parent.verticalCenter

            }


            spacing: 10



            Row {

                spacing: -2



                Repeater {

                    model: 10



                    delegate: Workspace {


                        active: Hyprland.focusedWorkspace
                                && (index + 1) === Hyprland.focusedWorkspace.id



                        occupied: workspaceOccupied(index + 1)

                    }

                }

            }

        }





        Text {

            anchors.centerIn: parent


            text: currentTime


            color: Theme.accent



            font {

                family: Theme.fontFamily
                pixelSize: Theme.fontSize
                weight: Font.ExtraBold

            }

        }





        Row {

            anchors {

                right: parent.right
                rightMargin: 20
                verticalCenter: parent.verticalCenter

            }


            spacing: 10


 // NETWORK

            Text {

                text: Status.wifiIcon



                color: Theme.accent



                font {

                    family: Theme.iconFontFamily
                    pixelSize: Theme.trayBar

                }

            }


            // MICROPHONE

            Text {

                text: Status.microphoneIcon



                color: Theme.accent



                font {

                    family: Theme.iconFontFamily
                    pixelSize: Theme.trayBar

                }

            }
            // VOLUME / HEADPHONES

            Text {

                text:

                    (
                        Status.headphonesConnected
                        ? "󰋋"
                        :
                        Status.volumeMuted
                        ? "󰝟"
                        :
                        "󰕾"
                    )

                    + " "

                    + Status.volume

                    + "%"



                color: Theme.accent



                font {

                    family: Theme.iconFontFamily
                    pixelSize: Theme.trayBar

                }

            }
              // BATTERY

            Text {

                text:
                    Status.batteryIcon
                    + " "
                    + Status.batteryPercent
                    + "%"



                color: Theme.accent



                font {

                    family: Theme.iconFontFamily
                    pixelSize: Theme.trayBar

                }

            }


        }


    }


}