import QtQuick 2.15

Rectangle {
    property int itemWidth: 30
    property int itemHeight: itemWidth
    id: timelineItem
//    color: "transparent"
    color: "#ff0000"
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
        console.log("timeline_item clicked")
    }

    function doubleClicked() {
        console.log("timeline_item double clicked")
    }

    function rightClicked() {
        console.log("timeline_item right clicked")
    }

    function mouseEntered() {
        console.log("timeline_item mouse entered")
    }

    function mouseExited() {
        console.log("timeline_item mouse exited")
    }
}
