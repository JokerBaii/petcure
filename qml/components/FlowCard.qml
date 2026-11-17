import QtQuick
import QtQuick.Layouts
import ".."
Card {
    id: card
    implicitHeight: 250
    color: "transparent"; border.width: 0
    Layout.minimumHeight: implicitHeight
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 22; spacing: 16
        RowLayout {
            Layout.fillWidth: true; spacing: 8
            LabelText { text: "清洁流程"; font.pixelSize: Theme.fsHeading; font.bold: true }
            LabelText { text: "6 步自动完成"; font.pixelSize: Theme.fsCaption; color: Theme.muted; Layout.fillWidth: true }
            Rectangle {
                radius: Theme.radiusPill; color: App.step < 0 ? Theme.chip : Theme.creamBg
                implicitWidth: stateLabel.implicitWidth + 24; implicitHeight: 28
                LabelText { id: stateLabel; anchors.centerIn: parent; text: App.step < 0 ? "等待开始" : App.paused ? "已暂停" : "进行中"; font.pixelSize: Theme.fsCaption; font.bold: true; color: App.step < 0 ? Theme.muted : Theme.progress }
            }
        }
        RowLayout {
            Layout.fillWidth: true; spacing: 0
            Repeater {
                model: App.steps
                delegate: ColumnLayout {
                    required property int index; required property string modelData
                    readonly property bool current: index === App.step
                    readonly property bool done: index < App.step
                    Layout.fillWidth: true; Layout.preferredWidth: 1; Layout.alignment: Qt.AlignTop; spacing: 8
                    Item {
                        Layout.fillWidth: true; Layout.preferredHeight: 38
                        Rectangle {
                            visible: index > 0; anchors.left: parent.left; anchors.right: dot.left; anchors.verticalCenter: parent.verticalCenter
                            height: 3; radius: 2; color: (current || done) ? Theme.okDot : "#ead9cb"
                            Behavior on color { ColorAnimation { duration: 250 } }
                        }
                        Rectangle {
                            visible: index < 5; anchors.left: dot.right; anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter
                            height: 3; radius: 2; color: done ? Theme.okDot : "#ead9cb"
                            Behavior on color { ColorAnimation { duration: 250 } }
                        }
                        Rectangle {
                            id: dot
                            anchors.centerIn: parent; width: 38; height: 38; radius: 19
                            color: current ? Theme.accent : done ? "#c4e1c0" : "#f6e9de"
                            border.width: current ? 3 : 0; border.color: "#fde3c4"
                            scale: current ? 1.1 : 1
                            Behavior on color { ColorAnimation { duration: 250 } }
                            Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack } }
                            Image { anchors.centerIn: parent; width: 20; height: 20; source: "../../assets/icons/" + ["sensors", "layers", "water_drop", "waves", "sync", "task_alt"][index] + ".svg" }
                        }
                    }
                    LabelText {
                        text: modelData; Layout.fillWidth: true; horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: Theme.fsCaption; font.bold: current; wrapMode: Text.Wrap
                        color: (current || done) ? Theme.ink : Theme.muted
                    }
                }
            }
        }
        Item { Layout.fillHeight: true }
        Rectangle {
            Layout.fillWidth: true; Layout.preferredHeight: 42; radius: 21; color: Theme.chip
            RowLayout {
                anchors.fill: parent; anchors.leftMargin: 18; anchors.rightMargin: 18; spacing: 10
                Rectangle {
                    Layout.preferredWidth: 8; Layout.preferredHeight: 8; radius: 4
                    color: App.step < 0 ? Theme.idleDot : App.paused ? Theme.warnDot : Theme.okDot
                }
                LabelText {
                    Layout.fillWidth: true; elide: Text.ElideRight; font.pixelSize: Theme.fsBody
                    text: App.step < 0 ? "设备待机，点击「开始清洁」启动流程" : (App.paused ? "已暂停：" : "流程进行中：") + App.steps[App.step]
                }
                LabelText { visible: App.step >= 0; text: "步骤 " + (App.step + 1) + " / 6"; font.pixelSize: Theme.fsCaption; font.bold: true; color: Theme.progress }
            }
        }
    }
}
