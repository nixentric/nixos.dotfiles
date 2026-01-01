import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
import "config"

Repeater{
            model: Hyprland.workspaces
            Rectangle {
                id: hitBox
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                implicitHeight: topBar.implicitHeight
                implicitWidth: 12
                color: "transparent"
                Rectangle {
                    id: workspacesButton
                    width: 10
                    height: modelData.focused ? 12 : 10
                    radius: 8
                    color: modelData.focused ? topBar.accentColor : topBar.buttonColor
                    anchors {
                        verticalCenter: hitBox.verticalCenter
                        horizontalCenter: hitBox.horizontalCenter
                    }
                    RectangularShadow {
                        anchors.fill: parent 
                        offset.x: 0
                        offset.y: 0
                        radius: parent.radius
                        blur: 30
                        spread: 6
                        color: "#1d1d1d"
                        opacity: 0.2
                    }
                    // Animate the dots to be bigger on the current workspace.
                    Behavior on width {
                        NumberAnimation {duration: 100; easing: Easing.OutSine}
                    }
                    Behavior on height {
                        NumberAnimation {duration: 100; easing: Easing.OutSine}
                    }
                }
            }
}