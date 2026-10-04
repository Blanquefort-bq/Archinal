pragma Singleton

import Quickshell


Singleton {

    id: root


    property real value: 100



    function set(value) {

        root.value = value


        let temperature = Math.round(
            1000 + (value / 100) * 5500
        )


        Quickshell.execDetached([
            "hyprctl",
            "hyprsunset",
            "temperature",
            temperature.toString()
        ])

    }



    function reset() {

        root.value = 100


        Quickshell.execDetached([
            "hyprctl",
            "hyprsunset",
            "identity"
        ])

    }

}