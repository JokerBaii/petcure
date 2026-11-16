import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 16
    RowLayout {
        Layout.fillWidth: true; spacing: 12
        Metric { Layout.fillWidth: true; title: "温度"; value: "38.5 ℃"; accent: "#db9a91" }
        Metric { Layout.fillWidth: true; title: "四角合力"; value: "2.4 N"; accent: "#91aab0" }
        Metric { Layout.fillWidth: true; title: "清洁液余量"; value: "78 %"; accent: "#79af9e" }
        Metric { Layout.fillWidth: true; title: "走纸距离"; value: "12.0 cm"; accent: "#cf9473" }
    }
    RowLayout {
        Layout.fillWidth: true; spacing: 16
        TrendCard { Layout.fillWidth: true; Layout.preferredWidth: 6; Layout.preferredHeight: 300 }
        Card {
            Layout.fillWidth: true; Layout.preferredWidth: 4; Layout.preferredHeight: 300
            ColumnLayout {
                anchors.fill: parent; anchors.margins: 22; spacing: 16
                SectionTitle { text: "四角压力"; Layout.fillWidth: true }
                GridLayout {
                    Layout.fillWidth: true; Layout.fillHeight: true; columns: 2; rowSpacing: 10; columnSpacing: 10
                    Repeater {
                        model: ["左前", "右前", "左后", "右后"]
                        delegate: Rectangle {
                            required property string modelData
                            Layout.fillWidth: true; Layout.fillHeight: true; radius: 14; color: "#f0f5ef"
                            Column { anchors.centerIn: parent; spacing: 5
                                LabelText { text: modelData; color: Theme.muted; anchors.horizontalCenter: parent.horizontalCenter }
                                LabelText { text: "0.6 N"; font.pixelSize: 19; font.bold: true; anchors.horizontalCenter: parent.horizontalCenter }
                            }
                        }
                    }
                }
            }
        }
    }
}
