import QtQuick
import "../../config"


Item {

    id: root


    signal optionSelected(string value)


    property string text: "SELECT"
    property var options: []

    property string selected: ""

    property bool opened: false

    property bool resetAfterSelect: false

    property string defaultSelection: ""


    width: Theme.sliderWidth
    height: Theme.controlRowHeight


    z: opened ? 1000 : 0



    Rectangle {

        id: mainBox


        width: parent.width
        height: Theme.controlRowHeight


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


            text: root.selected === ""
                ? root.text.toUpperCase()
                : root.selected.toUpperCase()


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


            text: opened ? ">" : "<"


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


        height: options.length * Theme.controlRowHeight


        color: Theme.background



        // LEFT BORDER
        Rectangle {

            anchors {

                left: parent.left
                top: parent.top
                bottom: parent.bottom

            }


            width: Theme.borderWidth

            color: Theme.accent

        }



        // RIGHT BORDER
        Rectangle {

            anchors {

                right: parent.right
                top: parent.top
                bottom: parent.bottom

            }


            width: Theme.borderWidth

            color: Theme.accent

        }



        // BOTTOM BORDER
        Rectangle {

            anchors {

                left: parent.left
                right: parent.right
                bottom: parent.bottom

            }


            height: Theme.borderWidth

            color: Theme.accent

        }



        Column {

            anchors.fill: parent



            Repeater {

                model: root.options



                Item {

                    width: parent.width
                    height: Theme.controlRowHeight



                    Text {

                        anchors {

                            left: parent.left
                            leftMargin: 10

                            verticalCenter: parent.verticalCenter

                        }


                        text: modelData.toUpperCase()


                        color: Theme.accent


                        font {

                            family: Theme.fontFamily
                            pixelSize: Theme.fontSize

                        }

                    }



                    MouseArea {

                        anchors.fill: parent


                        onClicked: {

                            root.selected = modelData

                            root.opened = false


                            root.optionSelected(modelData)


                            if (root.resetAfterSelect) {

                                root.selected = root.defaultSelection

                            }

                        }

                    }

                }

            }

        }

    }

}