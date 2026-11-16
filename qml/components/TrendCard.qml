import QtQuick
import QtQuick.Layouts
import ".."
Card {
    implicitHeight: 215
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 22; spacing: 16
        SectionTitle { text: "传感器趋势"; Layout.fillWidth: true }
        Item {
            Layout.fillWidth: true; Layout.fillHeight: true
            Column {
                anchors.centerIn: parent; spacing: 8
                LabelText { anchors.horizontalCenter: parent.horizontalCenter; text: "暂无趋势数据"; font.pixelSize: 15 }
                SmallText { anchors.horizontalCenter: parent.horizontalCenter; text: "数据采集后显示趋势"; font.pixelSize: 13 }
            }
        }
    }
}
