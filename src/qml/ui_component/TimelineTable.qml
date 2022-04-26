import QtQuick 2.15

Rectangle {
    width: parent.width
    height: parent.height
    property int rowCount: 5
    id: timelineTable
    Column {
        anchors.fill: parent
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
    //        setupLines(rowCount)
        }


    }
    color: "#272728"
    function setupLines(count) {
        for (var i=0; i<count; i++) {
            lineModel.append({index: i, count:30})
        }
    }
}

