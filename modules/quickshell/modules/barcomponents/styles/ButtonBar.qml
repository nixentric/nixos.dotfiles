import QtQuick
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    property string buttonColor: loader.buttonColor
    property bool ignoreHorizontalCenter 
    property bool anchorRight
    property bool anchorLeft
    property int buttonHeight 
    property int buttonWidth
    width: buttonWidth + 20
    height: topBar.height
    color: "transparent"
    Rectangle {
        id: visibleButton
        width: buttonWidth
        height: buttonHeight
        radius: 8
        opacity: 0.8
        color: buttonColor
        anchors {
            right: if (anchorRight == true) {parent.right} else {null}
            rightMargin: if (anchorRight == true) {10} else {null}
            left: if (anchorLeft == true) {parent.left} else {null}
            verticalCenter: root.verticalCenter
            horizontalCenter: if (ignoreHorizontalCenter == true) {null} else { root.horizontalCenter }
        }
        Shadow {opacity: 0.2}
        Behavior on width {
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutExpo
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.Out
            }
        }
        Behavior on height {
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutExpo
            }
        }
    }
}