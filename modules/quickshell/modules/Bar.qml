import QtQuick
import Quickshell
import Quickshell.Wayland
import "barcomponents"
import "barcomponents/styles"
import "barcomponents/config"

PanelWindow {
    // Set variables 
    // TODO: figure out how to do this better 
    property string baseWindowColor: loader.baseWindowColor
    property string baseTextColor: loader.baseTextColor
    property string accentColor: loader.accentColor
    property string buttonColor: loader.buttonColor
    property string buttonPressedColor: loader.buttonPressedColor
    property bool use12HourTime: loader.use12HourTime
    property double baseWindowOpacity: loader.baseWindowOpacity
    
    property int opacityAnimation: 0

    id: topBar
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: "topbar"
    color: "transparent"
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: FindPercentage.findPercentage(1.6, screen.height)
    margins {
        top: 0
        left: 0
        right: 0
    }
    // Create the bar. 
    Rectangle {
        id: bar
        opacity: baseWindowOpacity
        anchors.fill: parent
        color: baseWindowColor
    }
    // Workspaces section of the bar. 
        Row {
            id: workspacesRow
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 10
            }
            spacing: 14
            Workspaces {}
            Rectangle {
                height: bar.height
                width: 20
                color: "transparent"
            }
            TrayApp {}
        } 
    TimeWindow {id: timeWindow }
    ButtonBar {
        id: timeDisplayButton
        opacity: opacityAnimation
        buttonWidth: FindPercentage.findPercentage(120, timeHandler.width)
        buttonHeight: FindPercentage.findPercentage(70, topBar.implicitHeight)
        anchors {
            horizontalCenter: parent.horizontalCenter 
            verticalCenter: topBar.verticalCenter 
        }
        MouseArea {
            anchors.fill: parent 
            hoverEnabled: true
            onEntered: {
                if (timeWindow.visible == !true) {
                timeDisplayButton.buttonWidth = FindPercentage.findPercentage(150, timeHandler.width)
                timeDisplayButton.buttonHeight = FindPercentage.findPercentage(65, topBar.implicitHeight)
                timeDisplayButton.buttonColor = accentColor
                timeHandler.color = DetectBrightness.brightnessCheck(accentColor, 0.5) ? buttonPressedColor : baseTextColor
                }
            }
            onExited: {
                if (timeWindow.visible == !true) {
                    timeDisplayButton.buttonHeight = FindPercentage.findPercentage(70, topBar.implicitHeight)
                    timeDisplayButton.buttonWidth = FindPercentage.findPercentage(120, timeHandler.width)
                    timeDisplayButton.buttonColor = buttonColor
                    timeHandler.color = DetectBrightness.brightnessCheck(buttonColor, 0.5) ? buttonPressedColor : baseTextColor
                }
            }
            onClicked: {
                timeDisplayButton.buttonHeight = FindPercentage.findPercentage(55, topBar.implicitHeight)
                timeDisplayButton.buttonWidth = FindPercentage.findPercentage(170, timeHandler.width)
                timeDisplayButton.buttonColor = buttonPressedColor
                timeHandler.color = DetectBrightness.brightnessCheck(buttonPressedColor, 0.5) ? buttonPressedColor : baseTextColor
                timeWindow.visible = true
                timeWindow.offsetPopin = 10
                timeWindow.rectOpacity = baseWindowOpacity
            }
        }
        TextWithShadow {
            id: hermitBadge
            inputColor: buttonColor
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }            
            text: "Hermit"
            color: DetectBrightness.brightnessCheck(baseWindowColor, 0.5) ? buttonPressedColor : baseTextColor
            fontSizeMode: Text.Fit
            opacity: 1
            Behavior on opacity {
                NumberAnimation {
                    duration: 1050
                    easing.type: Easing.InQuad
                }
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.InQuad
            }
        }
        TimeHandler {id: timeHandler}
    }
    // System tray and settings button
    Row {
        id: trayRow
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }
        spacing: 14
        Rectangle {
            implicitHeight: topBar.implicitHeight
            implicitWidth: 2
            color: "transparent"
            anchors {
                right: right
                verticalCenter: bar.verticalCenter
            }
        }
        // Button for status window
    ButtonBar {
        id: statButton
        width: 40
        buttonHeight: FindPercentage.findPercentage(50, topBar.implicitHeight)
        buttonWidth: FindPercentage.findPercentage(1, screen.width)
        ignoreHorizontalCenter: true
        anchorRight: true
        anchors.verticalCenter: topBar.verticalCenter
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if (statWindow.visible == !true) {
                statButton.buttonColor = accentColor
                statButton.buttonWidth = FindPercentage.findPercentage(1.5, screen.width)
                }
            }
            onExited: {
                if (statWindow.visible == !true) {
                statButton.buttonColor = buttonColor
                statButton.buttonWidth = FindPercentage.findPercentage(1, screen.width)
                }
            }
            onClicked: {
                statButton.buttonColor = buttonPressedColor
                statButton.buttonWidth = FindPercentage.findPercentage(2, screen.width)
                statWindow.visible = true
                statWindow.offsetPopin = 10
                statWindow.rectOpacity = baseWindowOpacity
            }
        }
    }
    StatusWindow { id: statWindow}
    }
}