pragma Singleton

import Quickshell
import QtQuick

Singleton {
    function findPercentage(percent, size) {
        return (size* percent) / 100;
    }
}