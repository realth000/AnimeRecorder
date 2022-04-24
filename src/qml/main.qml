import QtQuick 2.15
import QtQuick.Window 2.15
import "ui_component"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    TimelineItem {
        anchors.fill: parent
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
    }
}
