pragma Singleton

import Quickshell
import QtQuick


Singleton {

    id: root


    function execute(action) {


        if (action === "IDLE") {

            return

        }


        else if (action === "LOCK") {

            Quickshell.execDetached([
                "hyprlock"
            ])

        }


        else if (action === "REBOOT") {

            Quickshell.execDetached([
                "systemctl",
                "reboot"
            ])

        }


        else if (action === "POWEROFF") {

            Quickshell.execDetached([
                "systemctl",
                "poweroff"
            ])

        }

    }

}