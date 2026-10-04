import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import "modules"
import "services"

ShellRoot {

    Variants {
        model: Quickshell.screens

        delegate: Bar {
            screen: modelData
        }
    }


    Dashboard {}

   IpcHandler {

        target: "dashboard"


        function toggle() {
            DashboardController.toggle()
        }

    }
}