pragma Singleton

import QtQuick
import Quickshell


Singleton {

    id: root


    property var notifications: [

        {
            id: 1,
            app: "Discord",
            sender: "Bertrand",
            message: "Hello from Discord",
            time: "22.07.2026 19:30"
        },

        {
            id: 2,
            app: "System",
            sender: "Battery",
            message: "Battery level 20%",
            time: "22.07.2026 19:31"
        },

        {
            id: 3,
            app: "Discord",
            sender: "Friend",
            message: "Are you coming?",
            time: "22.07.2026 19:32"
        }

    ]



    function remove(id) {


        let copy = notifications.filter(
            function(n) {
                return n.id !== id
            }
        )


        notifications = copy

    }



    function groups() {


        let result = {}


        for (let n of notifications) {


            if (!result[n.app])

                result[n.app] = []


            result[n.app].push(n)

        }


        return result

    }



    function add(app, sender, message) {


        notifications.unshift({

            id: Date.now(),

            app: app,

            sender: sender,

            message: message,

            time:
                Qt.formatDateTime(
                    new Date(),
                    "dd.MM.yyyy hh:mm"
                )

        })

    }

}