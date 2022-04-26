import QtQuick 2.15
import QtQuick.Controls 2.15
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
        onCurrentChanged: {
            if (index === 0) {
                s1.visible = true
                s2.visible = false
                s3.visible = false
            } else if (index === 1) {
                s1.visible = false
                s2.visible = true
                s3.visible = false
            } else if (index === 2) {
                s1.visible = false
                s2.visible = false
                s3.visible = true
            }
        }
    }
    // First page.
    TimelinePage {
        id: s1
        height: parent.height
        anchors.left: tabBar.right
        anchors.right: parent.right
    }

    // Second page.
    StackView {
        id: s2
        height: parent.height
        width: 400
        anchors.left: tabBar.right
        anchors.right: parent.right
        Rectangle {
            anchors.fill: parent
            color: "#00ff00"
        }
        visible: false
    }

    // Third page.
    StackView {
        id: s3
        height: parent.height
        width: 400
        anchors.left: tabBar.right
        anchors.right: parent.right
        Rectangle {
            anchors.fill: parent
            color: "#0000ff"
        }
        visible: false
    }

    color: "#272728"
}
