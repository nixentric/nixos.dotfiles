    import Quickshell
    import QtQuick
    import "styles"
    
    Text {
        id: timeDisplay

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        property string currentTime
        text: currentTime
        color: DetectBrightness.brightnessCheck(loader.accentColor, 0.5) ? loader.buttonPressedColor : loader.baseTextColor
        fontSizeMode: Text.Fit
        font.bold: true
        font.family: "Montserrat, sans-serif"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
        opacity: 0.0
        Shadow {opacity: 0.2}
        // This timer updates once a second, and updates the time once it is "triggered", ie: when it is created, and updates
        // the time once it's completed, ie: updating the time every second. The "onTriggered" is there to fill the date and 
        // time when the bar is first created, so it isn't blank for a second when the bar spawns.  

        Timer {
            interval: 1000
            running: true
            repeat: true
                onTriggered: {
                    var now = new Date()
                    if (loader.use12HourTime === "true") {
                    timeDisplay.currentTime = Qt.formatTime(now, "hh:mm:ss AP") + "  |  " + Qt.formatDate(now, "MM/dd/yyyy")
                    } else {
                        timeDisplay.currentTime = Qt.formatTime(now, "HH:mm:ss") + "  |  " + Qt.formatDate(now, "MM/dd/yyyy")
                    }
                }
        }
        Component.onCompleted: {
            hermitBadge.opacity = 0.0
            timeDisplay.opacity = 1.0
            topBar.opacityAnimation = 1
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 1850
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }
