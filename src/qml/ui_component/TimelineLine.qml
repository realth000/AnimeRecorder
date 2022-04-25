import QtQuick 2.15
import QtQml 2.15

Row {
    width: parent.width
    height: 30
    id: timelineLine
    property int columnCount: 5
    property int columnWidth: width / columnCount
    property int row: -1
    Repeater {
        id: repeater
        model:  itemModel
        delegate: itemDelegate
    }

    ListModel {
        id: itemModel
    }

    Component {
        id: itemDelegate
        TimelineItem {
            width: columnWidth
            height: timelineLine.height
            index: pos
        }
    }

    Component.onCompleted: {
        timelineLine.setupItems(timelineLine.columnCount)
//            searchItems()
    }

    function setupItems(count) {
        for(var i=0; i<count; i++)
            itemModel.append({name: "Apple",cost: 2.45,pos: i})
    }

    function searchItems() {
        for(var i=itemModel.count-1; i>=0; i--) {
            console.log(itemModel.get(i).index)
        }
    }
}


