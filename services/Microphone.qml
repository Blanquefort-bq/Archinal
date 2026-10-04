pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {

    id: root


    property real value: 50

    property bool muted: false



    Process {

        id: getVolume


        command: [
            "wpctl",
            "get-volume",
            "@DEFAULT_AUDIO_SOURCE@"
        ]



        stdout: StdioCollector {

            onStreamFinished: {

                let output = this.text.trim()


                let match = output.match(/([0-9.]+)/)


                if (match) {

                    root.value =
                        Number(match[1]) * 100

                }


                root.muted =
                    output.includes("MUTED")

            }

        }

    }



    Timer {

        interval: 100

        running: true

        repeat: true


        onTriggered: {

            if (!getVolume.running)
                getVolume.running = true

        }

    }



    function set(value) {

        root.value = value


        Quickshell.execDetached([
            "wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SOURCE@",
            Math.round(value) + "%"
        ])

    }

}