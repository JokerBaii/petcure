import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 20
    RowLayout {
        Layout.fillWidth: true; spacing: 24
        Image { source: "../../assets/images/pet-care-anime.png"; fillMode: Image.PreserveAspectFit; Layout.preferredWidth: 260; Layout.preferredHeight: 173; asynchronous: true }
        ColumnLayout {
            Layout.fillWidth: true; spacing: 8
            LabelText { text: "欢迎回来"; font.pixelSize: 32; font.bold: true; color: Theme.coral }
            LabelText { text: "准备好给爪爪洗香香了吗？"; font.pixelSize: 20; font.bold: true }
            LabelText { text: "最近清洁  " + App.lastTime + "  ·  " + App.runStatus; font.pixelSize: Theme.fsBody; color: Theme.muted }
        }
    }
    Card {
        Layout.fillWidth: true; implicitHeight: 96
        RowLayout {
            anchors.fill: parent; anchors.margins: 8; spacing: 0
            Repeater {
                model: [
                    { title: "今日清洁", value: App.count + " 次", icon: "history", fg: Theme.creamFg },
                    { title: "清洁液余量", value: "78 %", icon: "water_drop", fg: Theme.aquaFg },
                    { title: "温度", value: "38.5 ℃", icon: "thermostat", fg: Theme.roseFg },
                    { title: "四角合力", value: "2.4 N", icon: "compress", fg: Theme.skyFg }
                ]
                delegate: RowLayout {
                    required property int index
                    required property var modelData
                    Layout.fillWidth: true; Layout.preferredWidth: 1; Layout.fillHeight: true; spacing: 0
                    Rectangle { visible: index > 0; Layout.preferredWidth: 2; Layout.fillHeight: true; Layout.topMargin: 16; Layout.bottomMargin: 16; color: Theme.border }
                    ColumnLayout {
                        Layout.fillWidth: true; Layout.alignment: Qt.AlignVCenter; spacing: 4
                        RowLayout {
                            Layout.alignment: Qt.AlignHCenter; spacing: 6
                            Image { source: "../../assets/icons/" + modelData.icon + ".svg"; Layout.preferredWidth: 18; Layout.preferredHeight: 18 }
                            LabelText { text: modelData.title; color: modelData.fg; font.pixelSize: 13; font.bold: true }
                        }
                        LabelText { Layout.fillWidth: true; horizontalAlignment: Text.AlignHCenter; text: modelData.value; font.pixelSize: 24; font.bold: true }
                    }
                }
            }
        }
    }
    ControlCard { Layout.fillWidth: true; Layout.preferredHeight: 265 }
    FlowCard { Layout.fillWidth: true }
}
