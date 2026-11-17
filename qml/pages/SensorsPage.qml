import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 20
    Card {
        Layout.fillWidth: true; implicitHeight: 96
        RowLayout {
            anchors.fill: parent; anchors.margins: 8; spacing: 0
            Repeater {
                model: [
                    { title: "温度", value: "38.5 ℃", icon: "thermostat", fg: Theme.roseFg },
                    { title: "四角合力", value: "2.4 N", icon: "compress", fg: Theme.skyFg },
                    { title: "清洁液余量", value: "78 %", icon: "water_drop", fg: Theme.aquaFg },
                    { title: "走纸距离", value: "12.0 cm", icon: "route", fg: Theme.creamFg }
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
    RowLayout {
        Layout.fillWidth: true; spacing: 20
        TrendCard { Layout.fillWidth: true; Layout.preferredWidth: 6; Layout.preferredHeight: 315 }
        Card {
            Layout.fillWidth: true; Layout.preferredWidth: 4; Layout.preferredHeight: 315
            ColumnLayout {
                anchors.fill: parent; anchors.margins: 22; spacing: 12
                SectionTitle { text: "四角压力"; Layout.fillWidth: true }
                SmallText { text: "四个测点 · 演示数据" }
                GridLayout {
                    Layout.fillWidth: true; Layout.fillHeight: true; columns: 2; rowSpacing: 10; columnSpacing: 10
                    Repeater {
                        model: ["左前", "右前", "左后", "右后"]
                        delegate: Rectangle {
                            required property string modelData
                            Layout.fillWidth: true; Layout.fillHeight: true; radius: 18; color: Theme.mintBg
                            Column {
                                anchors.centerIn: parent; spacing: 5
                                LabelText { text: modelData; color: Theme.mintFg; font.bold: true; anchors.horizontalCenter: parent.horizontalCenter }
                                LabelText { text: "0.6 N"; font.pixelSize: 20; font.bold: true; anchors.horizontalCenter: parent.horizontalCenter }
                            }
                        }
                    }
                }
            }
        }
    }
}
