import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: button
    property color backgroundColor: "#ff0000"
    property color backgroundHoveredColor: "#00ff00"
    property color backgroundPressedColor: "#0000ff"

    background: Rectangle {
        color: getBackgroundColor()
    }

    function getBackgroundColor() {
        if (button.pressed) {
            return backgroundPressedColor
        } else if (button.hovered) {
            return backgroundHoveredColor
        } else {
            return backgroundColor
        }
    }
}
