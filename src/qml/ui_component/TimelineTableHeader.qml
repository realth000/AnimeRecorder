import QtQuick 2.15

Row {
    width: parent.width
    height: 30
    property int columnCount: 40
    property int columnWidth: width / columnCount
    id: tableHeader
   Repeater {
       id: repeater
       model: headerModel
       delegate: headerDelegate
   }

   ListModel {
       id: headerModel
   }

   Component {
       id: headerDelegate
       TimelineTableHeaderItem {
           index: itemCount
           width: columnWidth
       }
   }
   Component.onCompleted: {
       initHeader(tableHeader.columnCount)
   }

   function initHeader(columnCount) {
       for (var i=0; i<columnCount; i++)
        headerModel.append({itemCount: i})
   }
}
