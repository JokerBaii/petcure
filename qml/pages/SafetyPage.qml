import QtQuick
import QtQuick.Layouts
import ".."
import "../components"
ColumnLayout {
    spacing: 20
    Card {
        Layout.fillWidth: true; implicitHeight: 400; clip: true
        RowLayout {
            anchors.fill: parent; anchors.margins: 32; spacing: 24
            ColumnLayout {
                Layout.fillWidth: true; Layout.fillHeight: true; spacing: 14
                LabelText { text: "安全状态"; font.pixelSize: 19; font.bold: true }
                SmallText { text: "演示模式 · 安全信息仅供界面演示" }
                LabelText { Layout.topMargin: 8; text: "一切正常"; font.pixelSize: 30; font.bold: true; color: Theme.ok }
                LabelText { text: "当前没有模拟报警"; font.pixelSize: 14; color: Theme.muted }
                ColumnLayout {
                    Layout.fillWidth: true; Layout.topMargin: 8; spacing: 10
                    Repeater {
                        model: ["压力状态正常", "清洁液余量充足", "当前无报警"]
                        delegate: RowLayout {
                            required property string modelData
                            Layout.fillWidth: true; spacing: 10
                            LabelText { text: "✓"; font.pixelSize: 14; font.bold: true; color: Theme.ok }
                            LabelText { text: modelData; font.pixelSize: 14; Layout.fillWidth: true }
                        }
                    }
                }
                Item { Layout.fillHeight: true }
            }
            Image { source: "../../assets/images/safety-care.png"; fillMode: Image.PreserveAspectFit; Layout.preferredWidth: Math.min(parent.width * 0.34, 260); Layout.preferredHeight: 240; asynchronous: true }
        }
    }
}
