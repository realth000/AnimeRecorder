import QtQuick 2.15

Column {
   width: parent.width
   height: parent.height

   TimelineTableHeader {
       id: header
   }

   Repeater {
       model: 5
       TimelineLine {

       }
   }
}
