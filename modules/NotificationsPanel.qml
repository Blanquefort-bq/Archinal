import QtQuick
import Quickshell
import "../config"
import "../services"
import "components"


Item {

    id: root


    width: Theme.controlPanelWidth


    
    anchors {

        top: parent.top
        right: parent.right

        bottom: parent.bottom

    }



    Rectangle {


        anchors.fill: parent


        color: Theme.background



        border {

            width: Theme.borderWidth

            color: Theme.accent

        }



        Column {


            anchors {

                fill: parent

                margins: 10

            }



            spacing: Theme.rowSpacing




            Repeater {


                model: [

                    "Discord",

                    "System"

                ]



                delegate:


                    NotificationGroup {


                        app: modelData


                    }


            }


        }


    }


}