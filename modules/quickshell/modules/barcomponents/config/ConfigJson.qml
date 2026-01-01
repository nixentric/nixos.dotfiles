
import Quickshell
import Quickshell.Io 
import qs.modules

Singleton {
    id: root
    property string baseWindowColor: loader.baseWindowColor
    property string baseTextColor: loader.baseTextColor
    property string accentColor: loader.accentColor
    property string buttonColor: loader.buttonColor
    property string buttonPressedColor: loader.buttonPressedColor
    property string use12HourTime: loader.use12HourTime
    property double baseWindowOpacity: loader.baseWindowOpacity
    
        FileView {
            id: fileLoader
            path: Quickshell.env("HOME") + "/.config/hermit/config.json"
            watchChanges: true
            onFileChanged: reload()
            onAdapterUpdated: writeAdapter()
            JsonAdapter {
                id: loader
                property string baseWindowColor
                onBaseWindowColorChanged: {
                    console.log("Config Location: " + fileLoader.path)
                }
                property string baseTextColor
                property string accentColor
                property string buttonColor
                property string buttonPressedColor
                property bool use12HourTime
                onUse12HourTimeChanged: {
                    console.log("Use 12 Hour Time: " + use12HourTime)
                }
                property double baseWindowOpacity
            }
        }
}





    

