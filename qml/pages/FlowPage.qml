import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 16
    FlowCard { Layout.fillWidth: true; Layout.preferredHeight: 235 }
    Card {
        Layout.fillWidth: true; implicitHeight: 350
        ColumnLayout {
            anchors.fill: parent; anchors.margins: 22; spacing: 10
            SectionTitle { text: "步骤详情"; Layout.fillWidth: true }
            Repeater {
                model: App.steps
                delegate: RowLayout {
                    required property int index; required property string modelData
                    Layout.fillWidth: true; Layout.fillHeight: true; spacing: 14
                    Rectangle {
                        width: 4; height: 26; radius: 2
                        color: index === App.step ? "#c77b5d" : index < App.step ? "#84ad8a" : "#e8ded6"
                    }
                    LabelText { text: modelData; Layout.fillWidth: true; font.pixelSize: 15 }
                    LabelText { text: index === App.step ? (App.paused ? "已暂停" : "进行中") : index < App.step ? "已完成" : "未开始"; color: Theme.muted }
                }
            }
        }
    }
}
