import QtQuick 2.15
import QtQuick.Window 2.15
import "ui_component"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    TimelineTable {
        width: parent.width
        height: parent.height
    }
}
