pragma Singleton

import Quickshell

Singleton {

    property bool opened: false


    function toggle() {
        opened = !opened
         console.log("Dashboard opened:", opened)
    }

}