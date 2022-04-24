import QtQuick 2.15

Row {
    width: parent.width
    height: 30
    id: timelineTableHeader
   Repeater {
       id: repeater
       model: 12
       Rectangle {
           width: timelineTableHeader.parent.width / repeater.model
           height: 30
           border.color: "#f0f0f0"
           color: "#0000ff"
       }
   }
}
