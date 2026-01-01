import QtQuick
import QtQuick.Effects

RectangularShadow {
    anchors.fill: parent 
    offset.x: 0
    offset.y: 0
    radius: parent.radius
    blur: 30
    spread: 15
    color: "#1d1d1d"
    opacity: 0.6
}