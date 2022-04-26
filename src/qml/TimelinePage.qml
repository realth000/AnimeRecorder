import QtQuick 2.15
import QtQuick.Controls 1.4
import "ui_component"
TabView {
    id: tabView


    Component.onCompleted: {
        addNewTab("123")
        addNewTab("456")
        addNewTab("666")
    }

    function addNewTab(title) {
        var c = Qt.createComponent("./ui_component/TimelineTable.qml")
        var t = tabView.addTab(title, c)
        t.active = true
        t.item.setupLines(6)
    }
}
