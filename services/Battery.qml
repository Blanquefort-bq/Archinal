pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io


Singleton {

    id: root


    property int percent: 0

    property bool charging: false



    property string icon: {

        if (charging)
            return "󰂄"

        if (percent >= 90)
            return "󰁹"

        if (percent >= 70)
            return "󰂁"

        if (percent >= 40)
            return "󰁿"

        if (percent >= 15)
            return "󰁻"

        return "󰂎"

    }



    Process {

        id: batteryStatus


        command: [
            "sh",
            "-c",
            "cat /sys/class/power_supply/BAT*/capacity && cat /sys/class/power_supply/BAT*/status"
        ]



        stdout: StdioCollector {

            onStreamFinished: {

                let lines = this.text.trim().split("\n")


                if (lines.length >= 2) {

                    root.percent = Number(lines[0])


                    root.charging =
                        lines[1].trim() === "Charging"

                }

            }

        }

    }



    Timer {

        interval: 5000

        running: true

        repeat: true


        onTriggered: {

            if (!batteryStatus.running)

                batteryStatus.running = true

        }

    }



    Component.onCompleted: {

        batteryStatus.running = true

    }

}