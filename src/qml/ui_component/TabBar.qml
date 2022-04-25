import QtQuick 2.0


Column {
    id: tabBar
    width: 60
    height: parent.height
    property int buttonHeight: width
    property color buttonColor: "transparent"
    property color buttonHoveredColor: "transparent"
    property color buttonPressedColor: "transparent"
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
    }
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
    }
    TabBarButton {
        width: parent.width
        height: buttonHeight
//        backgroundColor: buttonColor
    }
}
