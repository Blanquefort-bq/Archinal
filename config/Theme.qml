pragma Singleton

import QtQuick

QtObject {

    //colours
    readonly property color background: "#000000"
    readonly property color accent: "#CFCFCF"
    readonly property color primary: "#575757"
    readonly property color secondary: "#292929"

    //fonts
    readonly property string fontFamily: "JetBrains Mono"
    readonly property string iconFontFamily: "JetBrainsMono Nerd Font"

    readonly property int fontSize : 18
    readonly property int iconSize: 22
  
    readonly property int controlIconWidth: 40


    //bar
    readonly property int barHeight: 70
    readonly property int trayBar: 16


    //border
    readonly property int borderWidth: 2



    //control panel
    readonly property int controlPanelWidth: 400
    readonly property int controlPanelHeight: 500

    readonly property int controlRowHeight: 40
    readonly property int rowSpacing: 10
    
    
    //slider
    readonly property int controlHeight: 40
    readonly property int sliderWidth: 320
}
