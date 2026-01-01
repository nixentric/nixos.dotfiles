import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "styles"
import "config"

PanelWindow {
    id: timeWindow
    visible: false
    WlrLayershell.namespace: "topbar"
    color: "transparent"
    property int offsetPopin: -screen.height
    property double rectOpacity: 0
    exclusiveZone: 0
    anchors {
        top: true
    }
    margins {
        top: 0
        left: 0
        right: 0
    }

    implicitHeight: screen.height - topBar.height
    implicitWidth: screen.width

    WlrLayershell.keyboardFocus: "Exclusive"


    MouseArea {
        anchors.fill: parent 
        hoverEnabled: true
        onClicked: {
            timeWindow.visible = false
            timeWindow.offsetPopin = -screen.height
            timeWindow.rectOpacity = 0
            timeDisplayButton.buttonHeight = FindPercentage.findPercentage(70, topBar.implicitHeight)
            timeDisplayButton.buttonWidth = FindPercentage.findPercentage(120, timeHandler.width)
            timeDisplayButton.buttonColor = loader.buttonColor
            timeHandler.color = DetectBrightness.brightnessCheck(loader.accentColor, 0.5) ? loader.buttonPressedColor : loader.baseTextColor
        }
    }

    Rectangle {
        id: timeWindowRect
        focus: true
        color: loader.baseWindowColor
        border.color: loader.accentColor
        border.width: 1
        Keys.onPressed: {
            timeWindow.visible = false
            timeWindow.offsetPopin = -screen.height
            timeDisplayButton.buttonHeight = FindPercentage.findPercentage(70, topBar.implicitHeight)
            timeDisplayButton.buttonWidth = FindPercentage.findPercentage(120, timeHandler.width)
            timeDisplayButton.buttonColor = loader.buttonColor
            timeHandler.color = DetectBrightness.brightnessCheck(loader.accentColor, 0.5) ? loader.buttonPressedColor : loader.baseTextColor         
            console.log("Escaped menu.")
        }
        anchors {
            top: parent.top
            topMargin: offsetPopin
            horizontalCenter: parent.horizontalCenter
        }
        opacity: rectOpacity
        implicitWidth: FindPercentage.findPercentage(25, timeWindow.width)
        implicitHeight: FindPercentage.findPercentage(40, timeWindow.height)
        radius: 8

        TextWithShadow {
            text: timeWindowRect.implicitHeight + " | " + timeWindowRect.implicitWidth
            font.pixelSize: 24
            inputColor: loader.baseWindowColor
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
        }
        Behavior on anchors.topMargin { 
            NumberAnimation {
                duration: 450
                easing.type: Easing.OutExpo
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 450
                easing.type: Easing.OutExpo 
            }
        }
        Shadow {}
    }
}