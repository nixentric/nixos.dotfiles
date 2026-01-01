import QtQuick
import QtQuick.Effects

Text {
    id: root
    property string inputColor: loader.accentColor
    property bool forceLight: false
    font.family: "Montserrat, sans-serif"
    color: if (forceLight == true) { color: baseTextColor } else {
        color: DetectBrightness.brightnessCheck(inputColor, 0.6) ? loader.buttonPressedColor : loader.baseTextColor
    } 
    RectangularShadow {
        anchors.fill: parent 
        offset.x: 0
        offset.y: 0
        radius: parent.radius
        blur: 30
        spread: 15
        color: "#1d1d1d"
        opacity: 0.2
    }
}