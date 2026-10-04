pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io


Singleton {

    id: root


    property real value: 85

    property bool muted: false

    property bool headphonesConnected: false



    Process {

        id: getVolume


        command: [
            "wpctl",
            "get-volume",
            "@DEFAULT_AUDIO_SINK@"
        ]


        stdout: StdioCollector {

            onStreamFinished: {

                let output = this.text.trim()


                let match = output.match(/([0-9.]+)/)


                if (match) {

                    root.value = Number(match[1]) * 100

                }


                root.muted = output.includes("MUTED")

            }

        }

    }



    Process {

    id: getHeadphones


    command: [
        "sh",
        "-c",
        "wpctl status | grep -A20 'Sinks:' | grep '\\*' "
    ]


    stdout: StdioCollector {

        onStreamFinished: {

            let output = this.text.trim()


            root.headphonesConnected =
                output.includes("bluez")
                ||
                output.includes("headset")
                ||
                output.includes("Headphone")
                ||
                output.includes("headphones")

        }

    }

}



    Timer {

        interval: 500

        running: true

        repeat: true


        onTriggered: {

            if (!getVolume.running)
                getVolume.running = true


            if (!getHeadphones.running)
                getHeadphones.running = true

        }

    }



    function set(value) {

        root.value = value


        Quickshell.execDetached([
            "wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            Math.round(value) + "%"
        ])

    }

}