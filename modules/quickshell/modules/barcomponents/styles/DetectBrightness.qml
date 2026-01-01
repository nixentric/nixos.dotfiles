pragma Singleton

import Quickshell
import QtQuick

Singleton {
    function brightnessCheck(hexColor, threshold) {
        var qmlColor = Qt.color(hexColor);
        // hslLightness is a value from 0.0 (dark) to 1.0 (bright)
        return qmlColor.hslLightness > threshold;
    }
}