pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root 

    PwObjectTracker {
        objects: Pipewire.nodes.values.filter(node => node.audio && !node.isStream)
    }

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource
    readonly property string name: sink.name

    function getName(): string {
        if (sink.name.includes("Focusrite")) {
            return "Focusrite Interface"
        }
    }

    function getVolume(): string {
        return Math.round(root.sink.audio.volume * 100)
    }
}