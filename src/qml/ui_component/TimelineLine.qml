import QtQuick 2.15

Row {
    width: parent.width
    height: 30
    id: timelineLine
    Repeater {
        id: repeater
        model: 12
        TimelineItem {
            width: timelineLine.width / repeater.model
            height: timelineLine.height
        }
    }
}
