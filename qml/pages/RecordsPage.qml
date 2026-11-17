import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 20
    Card {
        Layout.fillWidth: true; implicitHeight: 480
        ColumnLayout {
            anchors.fill: parent; anchors.margins: 28; spacing: 16
            RowLayout { Layout.fillWidth: true
                ColumnLayout { Layout.fillWidth: true; spacing: 5
                    SectionTitle { text: "清洁记录" }
                    SmallText { text: "今日 " + App.count + " 次  ·  最近一次 " + App.lastTime + "  ·  演示数据" }
                }
                Rectangle { color: Theme.chip; radius: Theme.radiusPill; implicitWidth: countLabel.implicitWidth + 28; implicitHeight: 30
                    LabelText { id: countLabel; anchors.centerIn: parent; text: App.records.length + " 条记录"; font.pixelSize: 12; color: Theme.muted }
                }
            }
            Item {
                visible: App.records.length === 0; Layout.fillWidth: true; Layout.fillHeight: true
                RowLayout { anchors.centerIn: parent; width: Math.min(parent.width - 32, 560); height: Math.min(parent.height - 24, 260); spacing: 24
                    Image { source: "../../assets/images/pet-rest-anime.png"; fillMode: Image.PreserveAspectFit; Layout.preferredWidth: parent.width * 0.5; Layout.fillHeight: true; asynchronous: true }
                    ColumnLayout { Layout.fillWidth: true; spacing: 8
                        LabelText { text: "还没有清洁记录"; font.pixelSize: 18; font.bold: true; Layout.fillWidth: true; wrapMode: Text.Wrap }
                        SmallText { text: "完成一次模拟清洁后，记录会出现在这里。"; Layout.fillWidth: true; wrapMode: Text.Wrap }
                    }
                }
            }
            ColumnLayout {
                visible: App.records.length > 0; Layout.fillWidth: true; Layout.fillHeight: true; spacing: 0
                Repeater {
                    model: App.records
                    delegate: ColumnLayout {
                        required property int index
                        required property var modelData
                        Layout.fillWidth: true; spacing: 0
                        Rectangle { visible: index > 0; Layout.fillWidth: true; Layout.preferredHeight: 2; color: Theme.border }
                        RowLayout {
                            Layout.fillWidth: true; Layout.preferredHeight: 58; spacing: 12
                            Image { source: "../../assets/icons/history.svg"; Layout.preferredWidth: 20; Layout.preferredHeight: 20 }
                            LabelText { text: modelData.time; Layout.fillWidth: true }
                            Rectangle { radius: Theme.radiusPill; implicitWidth: 72; implicitHeight: 28; color: Theme.okBg
                                LabelText { anchors.centerIn: parent; text: modelData.result; color: Theme.ok; font.pixelSize: 12; font.bold: true }
                            }
                        }
                    }
                }
                Item { Layout.fillHeight: true }
            }
        }
    }
}
