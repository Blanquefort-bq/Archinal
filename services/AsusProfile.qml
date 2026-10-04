pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {

    id: root


    property string batteryProfile: "Quiet"


    readonly property var profiles: [
        "Quiet",
        "Balanced",
        "Performance"
    ]



    Process {

        id: profileProcess


        command: [
            "sh",
            "-c",
            "asusctl profile get | grep 'Battery profile' | awk '{print $3}'"
        ]



        stdout: StdioCollector {

            onStreamFinished: {

                let value = text.trim()


                console.log(
                    "Battery profile detected:",
                    value
                )


                if (root.profiles.includes(value)) {

                    root.batteryProfile = value

                    console.log(
                        "Battery profile synced:",
                        root.batteryProfile
                    )

                }

            }

        }

    }



    Component.onCompleted: {

        profileProcess.running = true

    }



    function set(profile) {

        batteryProfile = profile


        Quickshell.execDetached([
            "asusctl",
            "profile",
            "set",
            "-b",
            profile
        ])

    }

}