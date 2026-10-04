import QtQuick
import "../../config"
import "."

Rectangle {


    id: root


    width: parent.width


    height: 130



    property string sender: ""

    property string app: ""

    property string message: ""

    property string time: ""

    property int notificationId



    signal closed()



    property bool hovered: false



    color:

        hovered

        ?

        Theme.accent

        :

        Theme.background



    border {

        width: Theme.borderWidth

        color: Theme.accent

    }



    radius: 0




    MouseArea {

        anchors.fill: parent

        hoverEnabled: true


        onEntered:

            root.hovered = true


        onExited:

            root.hovered = false

    }





    Text {


        anchors {

            top: parent.top

            left: parent.left

            margins: 10

        }


        text:

            sender



        color:

            hovered

            ?

            Theme.background

            :

            Theme.accent



        font {

            family: Theme.fontFamily

            pixelSize: Theme.fontSize

            weight: Font.ExtraBold

        }

    }





    Text {


        anchors {

            top: parent.top

            left: parent.left

            leftMargin: 130

            topMargin: 12

        }



        text: app



        color:

            hovered

            ?

            Theme.background

            :

            Theme.accent



        font {

            family: Theme.fontFamily

            pixelSize: 14

        }

    }







    Text {


        anchors {

            top: parent.top

            right: parent.right

            rightMargin: 10

            topMargin: 10

        }



        text:"X"



        color:

            hovered

            ?

            Theme.background

            :

            Theme.accent



        font {

            family: Theme.fontFamily

            pixelSize: Theme.fontSize

            weight: Font.Bold

        }



        MouseArea {

            anchors.fill: parent


            onClicked:

                root.closed()

        }

    }







    Text {


        anchors {

            top: parent.top

            topMargin: 40

            left: parent.left

            leftMargin:10

        }



        text: time



        color:

            hovered

            ?

            Theme.background

            :

            Theme.accent



        font {

            family: Theme.fontFamily

            pixelSize: 12

        }

    }







    Text {


        anchors {

            top: parent.top

            topMargin:70

            left: parent.left

            leftMargin:10

            right: parent.right

            rightMargin:10

        }



        wrapMode: Text.Wrap



        text: message



        color:

            hovered

            ?

            Theme.background

            :

            Theme.accent



        font {

            family: Theme.fontFamily

            pixelSize: Theme.fontSize

        }

    }


}