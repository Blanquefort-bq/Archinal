import QtQuick
import "../../config"
import "../../services"


Item {

    id: root


    width: Theme.sliderWidth
    height: Theme.controlRowHeight


    property bool opened: false

    property string currentNetwork: Wifi.currentNetwork


    z: root.opened ? 1000 : 0




    PasswordDialog {

        id: passwordDialog


        onSubmitted: function(password) {

            Wifi.connect(
                passwordDialog.ssid,
                password
            )

        }

    }





    Rectangle {

        id: mainBox


        anchors.fill: parent


        color: Theme.background


        border {

            width: Theme.borderWidth

            color: Theme.accent

        }





        Text {

            anchors {

                left: parent.left

                leftMargin: 10

                verticalCenter: parent.verticalCenter

            }



            text: root.currentNetwork.toUpperCase()



            color: Theme.accent



            font {

                family: Theme.fontFamily

                pixelSize: Theme.fontSize

            }

        }






        Text {

            anchors {

                right: parent.right

                rightMargin: 10

                verticalCenter: parent.verticalCenter

            }



            text: root.opened ? ">" : "<"



            color: Theme.accent



            font {

                family: Theme.fontFamily

                pixelSize: 30

                weight: Font.Black

            }

        }







        MouseArea {

            anchors.fill: parent



            onClicked: {


                root.opened = !root.opened



                if (root.opened)

                    Wifi.scan()


            }

        }

    }







    Rectangle {

        id: dropdown



        visible: root.opened



        z: 10000




        anchors {

            top: mainBox.bottom

            left: parent.left

            right: parent.right

        }





        height:

            Math.max(

                1,

                Wifi.networks.length

            )

            *

            Theme.controlRowHeight





        color: Theme.background





        Rectangle {

            width: Theme.borderWidth

            height: parent.height

            color: Theme.accent

            anchors.left: parent.left

        }





        Rectangle {

            width: Theme.borderWidth

            height: parent.height

            color: Theme.accent

            anchors.right: parent.right

        }





        Rectangle {

            width: parent.width

            height: Theme.borderWidth

            color: Theme.accent

            anchors.bottom: parent.bottom

        }








        Column {

            anchors.fill: parent






            Repeater {



                model:

                    Wifi.networks.length === 0

                    ?

                    [

                        {

                            ssid: "SCANNING...",

                            scanning: true,

                            connected: false

                        }

                    ]

                    :

                    Wifi.networks







                Item {



                    width: parent.width

                    height: Theme.controlRowHeight








                    Text {

                        anchors {

                            left: parent.left

                            leftMargin: 5

                            verticalCenter: parent.verticalCenter

                        }



                        text: modelData.ssid.toUpperCase()



                        color: Theme.accent





                        font {

                            family: Theme.fontFamily

                            pixelSize: 16

                            weight: Font.ExtraBold

                        }

                    }









                    Text {

                        anchors {

                            right: parent.right

                            rightMargin: 10

                            verticalCenter: parent.verticalCenter

                        }





                        text:



                            modelData.scanning

                            ?

                            ""

                            :



                            modelData.connected

                            ?

                            "DISCONNECT"

                            :

                            "CONNECT"






                        color: Theme.accent





                        font {

                            family: Theme.fontFamily

                            pixelSize: 14

                            weight: Font.Bold

                        }









                        MouseArea {



                            anchors.fill: parent






                            onClicked: {



                                if (modelData.scanning) {


                                    Wifi.scan()

                                    return

                                }







                                if (modelData.connected) {



                                    Wifi.disconnect()



                                }

                                else {






                                    if (

                                        modelData.security !== ""

                                        &&

                                        !Wifi.savedNetworks.includes(

                                            modelData.ssid

                                        )

                                    ) {





                                        passwordDialog.ssid = modelData.ssid


                                        passwordDialog.opened = true





                                    }

                                    else {





                                        Wifi.connect(

                                            modelData.ssid,

                                            ""

                                        )





                                    }

                                }

                            }

                        }

                    }

                }

            }

        }

    }

}