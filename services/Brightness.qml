pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io


Singleton {

    id: root


    property real value: 100



    Process {

        id: getBrightness


        command: [
            "brightnessctl",
            "get"
        ]


        stdout: StdioCollector {

            onStreamFinished: {

                let current = Number(this.text.trim())

                root.value = current

            }

        }

    }



    Timer {

        interval: 500

        running: true

        repeat: true


        onTriggered: {

            getBrightness.running = true

        }

    }



    function set(value) {

        root.value = value


        Quickshell.execDetached([
            "brightnessctl",
            "set",
            Math.round(value) + "%"
        ])

    }

}