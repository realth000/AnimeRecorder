import QtQuick 2.15

import QtQuick.Window 2.15
import "ui_component"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")
    id: appWindow
    // Tab bar on the left
    TabBar {
        id: tabBar
        width: 80
        height: parent.height
    }

    TimelineTable {
        height: parent.height
        anchors.left: tabBar.right
        anchors.right: appWindow.right
    }
    color: "#272728"
}
