import QtQuick 2.15

Column {
    width: parent.width
    height: parent.height
    id: timelineTable
    TimelineTableHeader {
        id: header
        columnCount: 30
    }

    Repeater {
        model: lineModel
        delegate: lineDelegate
    }

    ListModel {
        id: lineModel
    }

    Component{
        id: lineDelegate
        TimelineLine {
            columnCount: count
        }
    }

    Component.onCompleted: {
        setupLines(6)
    }

    function setupLines(count) {
        for (var i=0; i<count; i++) {
            lineModel.append({index: i, count:30})
        }
    }
}
