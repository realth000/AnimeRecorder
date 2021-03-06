import QtQuick 2.15

Rectangle {
    width: 30
    height: width
    id: timelineItem
//    color: "transparent"
    color: "#ff0000"
    border.color: "#00ff00"
    property int index: 0
    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                timelineItem.clicked()
            } else if (mouse.button === Qt.RightButton) {
                timelineItem.rightClicked()
            }
        }
        onDoubleClicked: {
            timelineItem.doubleClicked()
        }
        onEntered: {
            timelineItem.mouseEntered()
        }
        onExited: {
            timelineItem.mouseExited()
        }
    }

    function clicked() {
        console.log("timeline_item clicked", index)
    }

    function doubleClicked() {
        console.log("timeline_item double clicked", index)
    }

    function rightClicked() {
        console.log("timeline_item right clicked", index)
    }

    function mouseEntered() {
//        console.log("timeline_item mouse entered")
    }

    function mouseExited() {
//        console.log("timeline_item mouse exited")
    }
}
