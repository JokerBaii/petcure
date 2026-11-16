import QtQuick
import QtQuick.Layouts
import ".."
Card {
    id: metric
    property string title
    property string value
    property color accent: "#c68c6c"
    implicitHeight: 108
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 18; spacing: 10
        RowLayout {
            Layout.fillWidth: true
            Rectangle { width: 8; height: 8; radius: 4; color: metric.accent }
            LabelText { text: metric.title; color: Theme.muted; font.pixelSize: 14; Layout.fillWidth: true }
        }
        LabelText { text: metric.value; font.pixelSize: 23; font.bold: true; Layout.fillWidth: true; elide: Text.ElideRight }
    }
}
