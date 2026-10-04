pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {

    id: root


    property var networks: []

    property var savedNetworks: []

    property string currentNetwork: "NO CONNECTION"

    property bool connected:
        currentNetwork !== "NO CONNECTION"


    property bool ethernetConnected: false




    Process {

        id: wifiScanProcess


        command: [
            "sh",
            "-c",
            "nmcli -t -f ACTIVE,SSID,SIGNAL,SECURITY dev wifi list"
        ]


        stdout: StdioCollector {

            onStreamFinished: {

                let result = []


                for (let line of text.split("\n")) {


                    if (line.trim() === "")
                        continue


                    let parts = line.split(":")


                    let connected = parts[0] === "yes"



                    if (connected){
                        root.currentNetwork = parts[1]
                    }
                       



                    result.push({

                        connected: connected,

                        ssid: parts[1],

                        signal: parts[2],

                        security: parts[3]

                    })


                }


                root.networks = result


                console.log(
                    "NETWORKS:",
                    JSON.stringify(root.networks)
                )

            }

        }

    }





    Process {

        id: savedProcess


        command: [

            "sh",

            "-c",

            "nmcli -t -f NAME,TYPE connection show"

        ]



        stdout: StdioCollector {


            onStreamFinished: {


                let result = []



                for (let line of text.split("\n")) {


                    if (line.trim() === "")
                        continue



                    let parts = line.split(":")



                    if (parts[1] === "wifi")

                        result.push(parts[0])


                }



                root.savedNetworks = result



                console.log(
                    "SAVED WIFI:",
                    JSON.stringify(root.savedNetworks)
                )

            }

        }

    }






    Timer {

        id: refreshTimer


        interval: 3000


        repeat: false



        onTriggered: {


            scan()


        }

    }






    function loadSavedNetworks() {


        savedProcess.running = true


    }






    function scan() {


        loadSavedNetworks()



        Quickshell.execDetached([

            "nmcli",

            "device",

            "wifi",

            "rescan"

        ])



        wifiScanProcess.running = true


    }



function updateConnection() {

    Quickshell.execDetached([

        "sh",

        "-c",

        "nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes'"

    ])

}



    function connect(ssid, password) {



        console.log(
            "CONNECT:",
            ssid
        )



        if (root.savedNetworks.includes(ssid)) {



            console.log(
                "USING SAVED CONNECTION"
            )



            Quickshell.execDetached([

                "nmcli",

                "connection",

                "up",

                ssid

            ])



        }


        else {



            console.log(
                "NEW CONNECTION"
            )



            Quickshell.execDetached([

                "nmcli",

                "device",

                "wifi",

                "connect",

                ssid,

                "password",

                password

            ])



        }



        refreshTimer.restart()


    }







    function disconnect() {



        Quickshell.execDetached([

            "sh",

            "-c",

            "nmcli device disconnect $(nmcli -t -f DEVICE,TYPE device | grep ':wifi' | cut -d: -f1)"

        ])



        refreshTimer.restart()


    }


}