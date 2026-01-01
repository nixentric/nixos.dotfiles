import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Effects
import QtQuick.Controls

    Repeater {
        id: root
        model: SystemTray.items
        property double positionTo
        property bool targetMenuOpen: false 
        Rectangle {
            id: trayItem 
            antialiasing: true
            anchors {
                verticalCenter: parent.verticalCenter
            }
            required property SystemTrayItem modelData
            implicitWidth: 18
            implicitHeight: 18
            color: "transparent"
            Image {
                id: trayIcon 
                source: trayItem.modelData.icon
                mipmap: true
                smooth: true
                fillMode: Image.PreserveAspectFit
                anchors {
                    fill: parent
                }
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
            MouseArea {
                id: clicky
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: event => {
                    if (event.button === Qt.RightButton) {
                        if (trayItem.modelData.hasMenu) {
                            const globalPos = mapToGlobal(0, 0);
                            const screenX = screen.x
                            const relativeX = globalPos.x + screen.x
                            menu.open();
                    }
                    } else {
                        trayItem.modelData.activate()
                    }
                }
            }

                QsMenuAnchor {
                    id: menu

                    menu: trayItem.modelData.menu
                    anchor.window: topBar
                    anchor.rect.x: relativeX
                    anchor.rect.y: root.y + topBar.implicitHeight
                    anchor.rect.height: root.height 
                    anchor.rect.width: root.width
                }

        }
}
    
