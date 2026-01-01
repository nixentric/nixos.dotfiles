import QtQuick
import QtQuick.Effects
import Quickshell
import Qt5Compat.GraphicalEffects
import Quickshell.Hyprland
import "styles"

Repeater {
    anchors {
        left: parent.left
        right: parent.right
    }
    model: ["power", "restart", "lock", "logout"]
    Rectangle {
        required property string modelData
        property string btnId: modelData
        objectName: btnId
        width: statWindowRect.width / 5
        height: 40
        radius: 8
        color: topBar.buttonPressedColor
        Shadow {id: btnShadow}
        Behavior on color {
            ColorAnimation {
                duration: 450
            }
        }
        Text {
            font.family: "Montserrat, sans-serif"
            font.capitalization: Font.Capitalize
            text: modelData
            color: "white"
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
        }
        MouseArea {
            anchors.fill: parent 
            hoverEnabled: true
            onEntered: {
                if (btnId === "power") {
                    statWindowRect.color = '#5e1414'
                    parent.color = "#5e1414"
                } else {
                    statWindowRect.color = topBar.accentColor
                    parent.color = topBar.accentColor                  
                }
            }
            onClicked: {
                if (btnId === "power")
                    Hyprland.dispatch("exec shutdown -h now")
                else if (btnId === "restart")
                    Hyprland.dispatch("exec reboot")
                else if (btnId === "lock")
                    Hyprland.dispatch("exec hyprlock")
                else if (btnId === "logout")
                    Hyprland.dispatch("exit")
            }
            onExited: {
                statWindowRect.color = topBar.baseWindowColor
                parent.color = topBar.buttonPressedColor
            }
        }
    }
}