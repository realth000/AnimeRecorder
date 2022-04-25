import QtQuick 2.15

Rectangle {
    width: 30
    height: parent.height
    id: headerItem
    color: "#00ff00"
    border.color: "#0000ff"
    property int index: 0

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                headerItem.clicked()
            } else if (mouse.button === Qt.RightButton) {
                headerItem.rightClicked()
            }
        }
        onDoubleClicked: {
            headerItem.doubleClicked()
        }
        onEntered: {
            headerItem.mouseEntered()
        }
        onExited: {
            headerItem.mouseExited()
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
