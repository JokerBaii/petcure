import QtQuick
import QtQuick.Layouts
import ".."
Card {
    implicitHeight: 250
    color: "#e8f0e7"; border.color: "#dce8dc"
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 22; spacing: 12
        LabelText { text: "安全状态"; font.pixelSize: 18; font.bold: true }
        LabelText { text: "一切正常"; font.pixelSize: 25; font.bold: true; color: "#52785c"; Layout.topMargin: 4 }
        Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 1; color: "#cfdfd0" }
        Repeater {
            model: ["压力状态正常", "清洁液余量充足", "当前无报警"]
            delegate: RowLayout {
                required property string modelData
                Layout.fillWidth: true; spacing: 10
                LabelText { text: "✓"; color: "#6d9a78"; font.bold: true }
                LabelText { text: modelData; font.pixelSize: 14; color: "#526d57" }
            }
        }
        Item { Layout.fillHeight: true }
    }
}
