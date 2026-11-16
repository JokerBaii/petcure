import QtQuick
import QtQuick.Layouts
import ".."
Card {
    id: card
    property bool flat: false
    color: flat ? "transparent" : "#fffcf9"
    border.color: flat ? "transparent" : "#e8e1da"
    implicitHeight: width < 700 ? 300 : 250
    Layout.minimumHeight: implicitHeight
    ColumnLayout {
        anchors.fill: parent; anchors.margins: flat ? 0 : 22; spacing: 16
        RowLayout {
            Layout.fillWidth: true
            LabelText { text: "清洁流程"; font.pixelSize: 18; font.bold: true; Layout.fillWidth: true }
            LabelText { text: App.step < 0 ? "等待开始" : App.paused ? "已暂停" : "进行中"; color: App.step < 0 ? Theme.muted : "#a55f47"; font.pixelSize: 14 }
        }
        GridLayout {
            Layout.fillWidth: true; Layout.fillHeight: true
            columns: card.width < 700 ? 3 : 6; columnSpacing: 12; rowSpacing: 18
            Repeater {
                model: App.steps
                delegate: ColumnLayout {
                    required property int index; required property string modelData
                    Layout.fillWidth: true; spacing: 9
                    Image {
                        source: "../../assets/icons/" + ["sensors", "layers", "water_drop", "waves", "sync", "task_alt"][index] + ".svg"
                        Layout.preferredWidth: 25; Layout.preferredHeight: 25; opacity: index === App.step ? 1 : 0.68
                    }
                    Rectangle {
                        Layout.fillWidth: true; Layout.preferredHeight: 4; radius: 2
                        color: index === App.step ? "#c77b5d" : index < App.step ? "#84ad8a" : "#e8ded6"
                        Behavior on color { ColorAnimation { duration: 300 } }
                    }
                    LabelText { text: modelData; font.pixelSize: 14; font.bold: index === App.step; wrapMode: Text.Wrap; Layout.fillWidth: true }
                    LabelText { text: index === App.step ? (App.paused ? "已暂停" : "进行中") : index < App.step ? "已完成" : "待开始"; color: index === App.step ? "#ad7057" : Theme.muted; font.pixelSize: 12 }
                }
            }
        }
    }
}
