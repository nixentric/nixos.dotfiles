import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import "styles"
import "config"

PanelWindow { 
    id: statWindow
    visible: false
    // set namespace == the bar so blur is easier in hyprland.conf
    WlrLayershell.namespace: "topbar"
    WlrLayershell.keyboardFocus: "Exclusive"
    property int offsetPopin: -600
    property double rectOpacity: 0
    color: "transparent"
    anchors {
        top: true
        right: true
    }
    implicitHeight: screen.height - topBar.implicitHeight
    implicitWidth: screen.width 
    margins {
        top: 0
        left: 0
        right: 0
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            statWindow.offsetPopin = -600
            statWindow.rectOpacity = 0
            statWindow.visible = false
            statButton.buttonWidth = FindPercentage.findPercentage(1, topBar.width)
            statButton.buttonColor = buttonColor
        }
    }
    Rectangle {
        id: statWindowRect
        focus: true
        Keys.onPressed: {
            statWindow.offsetPopin = -600
            statWindow.rectOpacity = 0
            statWindow.visible = false
            statButton.buttonWidth = FindPercentage.findPercentage(1, topBar.width)
            statButton.buttonColor = buttonColor
            console.log("Escaped menu.")
        }
        anchors {
            top: parent.top
            topMargin: 10
            right: parent.right
            rightMargin: offsetPopin
        }
        property int screenBar: screen.height - topBar.implicitHeight 
        implicitHeight: screenBar / 10
        implicitWidth: screen.width / 5
        color: topBar.baseWindowColor
        opacity: rectOpacity
        radius: 8
        border.color: topBar.accentColor
        border.width: 1
        Shadow {id: powerShadow}
        Behavior on anchors.rightMargin { 
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
        Behavior on color {
            ColorAnimation {
                duration: 450

            }
        }
        TextWithShadow {
            id: powerText
            text: "Power"
            font.pixelSize: 24
            inputColor: loader.baseWindowColor
            anchors {
                top: parent.top
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
        }
        Row {
            id: powerRow
            height: statWindowRect.implicitHeight / 2
            width: statWindowRect.implicitWidth
            spacing: statWindowRect.implicitWidth / 21

            anchors {
                top: powerRow.top
                left: parent.left
                leftMargin: 10
                bottom: parent.bottom
            }
        StatButton {}
        }
    }
       Rectangle {
        id: statWindowAudio
        anchors {
            top: statWindowRect.bottom
            topMargin: 10
            right: parent.right
            rightMargin: offsetPopin
        }
        property int screenBar: screen.height - topBar.implicitHeight 
        implicitHeight: screenBar / 6
        implicitWidth: screen.width / 5
        color: loader.baseWindowColor
        opacity: rectOpacity
        radius: 8
        border.color: topBar.accentColor
        border.width: 1
        Shadow {id: audioShadow}        
        TextWithShadow {
            id: audioText
            text: "Audio"
            font.pixelSize: 24
            inputColor: loader.baseWindowColor
            anchors {
                top: parent.top
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
        }
        Behavior on anchors.rightMargin { 
            NumberAnimation {
                duration: 550
                easing.type: Easing.OutExpo
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 450
                easing.type: Easing.OutExpo 
            }
        }
    }
    Rectangle {
        id: statWindowTemp
        anchors {
            top: statWindowAudio.bottom
            topMargin: 10
            right: parent.right
            rightMargin: offsetPopin
        }
        property int screenBar: screen.height - topBar.implicitHeight 
        implicitHeight: 740
        implicitWidth: screen.width / 5
        color: loader.baseWindowColor
        opacity: rectOpacity
        radius: 8
        border.color: topBar.accentColor
        border.width: 1
        Shadow {id: notifShadow}        
        TextWithShadow {
            id: notifText
            text: "Notifications"
            font.pixelSize: 24
            inputColor: loader.baseWindowColor
            anchors {
                top: parent.top
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
        }
        Behavior on anchors.rightMargin { 
            NumberAnimation {
                duration: 650
                easing.type: Easing.OutExpo
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 650
                easing.type: Easing.OutExpo 
            }
        }
    }
}