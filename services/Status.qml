pragma Singleton

import Quickshell
import QtQuick
import "."

Singleton {

    id: root


    // =====================
    // BATTERY
    // =====================

    property int batteryPercent: Battery.percent

    property bool batteryCharging: false


    property string batteryIcon: Battery.icon



    // =====================
    // VOLUME
    // =====================

    property int volume: Volume.value


    property bool volumeMuted: Volume.muted


    property bool headphonesConnected:
        Volume.headphonesConnected



    property string volumeIcon: {

        if (headphonesConnected)
            return "󰋋"

        if (volumeMuted)
            return "󰝟"

        if (volume > 70)
            return "󰕾"

        if (volume > 30)
            return "󰖀"

        return "󰕿"

    }



    // =====================
    // WIFI / NETWORK
    // =====================

    property bool wifiConnected:
        Wifi.connected


    property bool ethernetConnected:
        Wifi.ethernetConnected


    property string networkName:
        Wifi.currentNetwork



    property string wifiIcon: {

        if (ethernetConnected)
            return "󰈀"

        if (wifiConnected)
            return "󰖩"

        return "󰖪"

    }



    // =====================
    // MICROPHONE
    // =====================

    property bool microphoneMuted:
        Microphone.muted



    property string microphoneIcon: {

        if (microphoneMuted)
            return "󰍭"

        return "󰍬"

    }

}