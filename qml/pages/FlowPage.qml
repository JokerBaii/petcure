import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 16
    Card {
        Layout.fillWidth: true; implicitHeight: 440
        ColumnLayout {
            anchors.fill: parent; anchors.margins: 22; spacing: 10
            RowLayout {
                Layout.fillWidth: true
                ColumnLayout { Layout.fillWidth: true; spacing: 4
                    SectionTitle { text: "清洁步骤" }
                    SmallText { text: "查看每一步的运行状态 · 演示模式" }
                }
                LabelText { text: App.step < 0 ? "等待开始" : App.paused ? "已暂停" : "进行中"; color: App.step < 0 ? Theme.muted : Theme.progress; font.pixelSize: 13 }
            }
            Repeater {
                model: App.steps
                delegate: Rectangle {
                    required property int index; required property string modelData
                    readonly property bool current: index === App.step
                    readonly property bool done: index < App.step
                    Layout.fillWidth: true; Layout.fillHeight: true; radius: 12
                    color: current ? "#fdeedd" : "transparent"
                    Behavior on color { ColorAnimation { duration: 250 } }
                    RowLayout {
                        anchors.fill: parent; anchors.leftMargin: 14; anchors.rightMargin: 14; spacing: 12
                        Rectangle {
                            Layout.preferredWidth: 29; Layout.preferredHeight: 29; radius: 15
                            color: current ? "#f6aa61" : done ? "#c4e1c0" : "#f6e9de"
                            Behavior on color { ColorAnimation { duration: 250 } }
                            LabelText { anchors.centerIn: parent; text: "0" + (index + 1); font.pixelSize: 12; font.bold: true }
                        }
                        LabelText { text: modelData; Layout.fillWidth: true; font.pixelSize: 14; font.bold: current }
                        LabelText { text: current ? (App.paused ? "已暂停" : "进行中") : done ? "已完成" : "未开始"; color: current ? Theme.progress : done ? Theme.ok : Theme.muted; font.pixelSize: 12 }
                    }
                }
            }
        }
    }
}
