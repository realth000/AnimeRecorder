import QtQuick 2.0


Column {
    id: tabBar
    width: 60
    height: parent.height
    property int buttonHeight: width
    property color buttonColor: "transparent"
    property color buttonHoveredColor: "transparent"
    property color buttonPressedColor: "transparent"
    signal currentChanged(int index)
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
        onClicked: {
            tabBar.currentChanged(0)
        }
    }
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
        onClicked: {
            tabBar.currentChanged(1)
        }
    }
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
        onClicked: {
            tabBar.currentChanged(2)
        }
    }
}
