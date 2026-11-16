import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 16
    RowLayout {
        Layout.fillWidth: true; spacing: 12
        Metric { Layout.fillWidth: true; title: "今日清洁"; value: App.count + " 次" }
        Metric { Layout.fillWidth: true; title: "最近一次"; value: App.lastTime; accent: "#79af9e" }
    }
    Card {
        Layout.fillWidth: true; implicitHeight: 350
        ColumnLayout {
            anchors.fill: parent; anchors.margins: 22; spacing: 14
            SectionTitle { text: "清洁记录"; Layout.fillWidth: true }
            Item {
                visible: App.records.length === 0; Layout.fillWidth: true; Layout.fillHeight: true
                ColumnLayout {
                    anchors.centerIn: parent; spacing: 8
                    Image { source: "../../assets/images/empty-records-puppy.png"; fillMode: Image.PreserveAspectFit; Layout.preferredWidth: 220; Layout.preferredHeight: 180; Layout.alignment: Qt.AlignHCenter; asynchronous: true }
                    LabelText { text: "暂无清洁记录"; font.pixelSize: 15; Layout.alignment: Qt.AlignHCenter }
                }
            }
            ColumnLayout {
                visible: App.records.length > 0; Layout.fillWidth: true; Layout.fillHeight: true; spacing: 0
                Repeater {
                    model: App.records
                    delegate: Rectangle {
                        required property var modelData
                        Layout.fillWidth: true; Layout.preferredHeight: 55; color: "transparent"
                        RowLayout { anchors.fill: parent
                            LabelText { text: modelData.time; Layout.fillWidth: true }
                            LabelText { text: modelData.result; color: "#52785c" }
                        }
                        Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "#eee8e1" }
                    }
                }
                Item { Layout.fillHeight: true }
            }
        }
    }
}
