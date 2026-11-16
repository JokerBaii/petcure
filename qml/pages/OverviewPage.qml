import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 0
    ControlCard { Layout.fillWidth: true; Layout.preferredHeight: 265 }
    RowLayout {
        Layout.fillWidth: true; Layout.topMargin: 25; Layout.bottomMargin: 16
        LabelText { text: "设备概况"; font.pixelSize: 18; font.bold: true; Layout.fillWidth: true }
        LabelText { text: "最近清洁  " + App.lastTime; color: Theme.muted; font.pixelSize: 13 }
    }
    RowLayout {
        Layout.fillWidth: true; spacing: 0; Layout.preferredHeight: 87
        Repeater {
            model: [
                { title: "今日清洁", value: App.count + " 次", icon: "history" },
                { title: "清洁液余量", value: "78 %", icon: "water_drop" },
                { title: "温度", value: "38.5 ℃", icon: "thermostat" },
                { title: "四角合力", value: "2.4 N", icon: "compress" }
            ]
            delegate: Item {
                required property int index; required property var modelData
                Layout.fillWidth: true; Layout.fillHeight: true
                Rectangle { visible: index > 0; x: 0; anchors.verticalCenter: parent.verticalCenter; width: 1; height: 52; color: "#e6d8cd" }
                Row {
                    anchors.left: parent.left; anchors.leftMargin: index === 0 ? 0 : 20; anchors.verticalCenter: parent.verticalCenter; spacing: 12
                    Rectangle {
                        width: 38; height: 38; radius: 13; color: ["#f4e2d5", "#dfeee7", "#f6e1df", "#e2ebea"][index]
                        Image { anchors.centerIn: parent; width: 20; height: 20; source: "../../assets/icons/" + modelData.icon + ".svg" }
                    }
                    Column { spacing: 4
                        LabelText { text: modelData.title; color: Theme.muted; font.pixelSize: 13 }
                        LabelText { text: modelData.value; font.pixelSize: 22; font.bold: true }
                    }
                }
            }
        }
    }
    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 1; Layout.topMargin: 10; color: "#e8ded5" }
    FlowCard {
        flat: true; Layout.fillWidth: true; Layout.fillHeight: true
        Layout.topMargin: 25; Layout.bottomMargin: 20
    }
}
