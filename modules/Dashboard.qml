import QtQuick
import Quickshell
import Quickshell.Wayland
import "../services"
import "../config"


PanelWindow {

    visible: DashboardController.opened

    focusable: true


    anchors {

        top: true
        bottom: true
        left: true
        right: true

    }


    WlrLayershell.layer: WlrLayer.Overlay

    color: Theme.background



    Item {

        anchors.fill: parent



        ControlPanel {

            id: controlPanel


            anchors {

                top: parent.top

                right: parent.right

            }


            anchors.topMargin: 20

            anchors.rightMargin: 10


        }



        NotificationsPanel {


            anchors {

                top: controlPanel.bottom

                right: parent.right

                bottom: parent.bottom


            }


            anchors.topMargin: 10

            anchors.rightMargin: 10


        }


    }

}