//@ pragma UseQApplication

import QtQuick
import Quickshell
import "modules"
import "modules/barcomponents/config"
/*
    Hi. I'm not a programmer please don't dissect my code and call me stupid 
    pls i don't know what i'm doing :( 
*/

ShellRoot {
    id: root
    ConfigJson{id: loader}
    Bar {}
}
