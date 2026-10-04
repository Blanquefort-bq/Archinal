import QtQuick
import "../../config"


Item {

    id: root


    property bool opened: false

    property string ssid: ""

    property bool showPassword: false


    signal submitted(string password)



    anchors.fill: parent

    visible: root.opened

    z: 20000



    Rectangle {

        anchors.fill: parent

        color: "#000000AA"

    }



    Rectangle {

        id: passwordBox


        width: Theme.sliderWidth

        height: Theme.controlRowHeight


        anchors.centerIn: parent


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


            visible: input.text.length === 0


            text: root.ssid.toUpperCase()


            color: Theme.primary


            font {

                family: Theme.fontFamily

                pixelSize: Theme.fontSize

            }

        }



        TextInput {

            id: input


            anchors {

                left: parent.left

                right: eye.left

                verticalCenter: parent.verticalCenter

            }


            leftPadding: 10


            width: parent.width - eye.width - 20


            color: Theme.accent


            font {

                family: Theme.fontFamily

                pixelSize: Theme.fontSize

            }


            focus: true


            echoMode:

                root.showPassword

                ? TextInput.Normal

                : TextInput.Password



            clip: true



            Keys.onReturnPressed: {

                root.submitted(input.text)

                root.opened = false

                input.clear()

            }



            Keys.onEnterPressed: {

                root.submitted(input.text)

                root.opened = false

                input.clear()

            }

        }



        Text {

            id: eye


            anchors {

                right: parent.right

                rightMargin: 10

                verticalCenter: parent.verticalCenter

            }


            text:

                root.showPassword

                ? "󰈈"

                : "󰈉"



            color: Theme.accent


            font {

                family: Theme.iconFontFamily

                pixelSize: Theme.iconSize

            }



            MouseArea {

                anchors.fill: parent


                onClicked: {

                    root.showPassword =
                        !root.showPassword


                    input.forceActiveFocus()

                }

            }

        }

    }



    onOpenedChanged: {

        if (opened) {

            input.clear()

            showPassword = false

            input.forceActiveFocus()

        }

    }

}