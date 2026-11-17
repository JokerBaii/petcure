import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."
Card {
    id: card
    implicitHeight: 250
    color: "#ffeedd"; clip: true
    Image {
        id: puppy
        visible: card.width >= 550
        source: "../../assets/images/pet-care-duo.png"; fillMode: Image.PreserveAspectFit
        anchors.right: parent.right; anchors.rightMargin: 32; anchors.bottom: parent.bottom
        width: Math.min(parent.width * 0.41, 340); height: parent.height * 0.95; asynchronous: true
        transform: Rotation {
            origin.x: puppy.width / 2; origin.y: puppy.height * 0.8
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: puppyHover.hovered ? Math.max(-5, Math.min(5, (puppyHover.point.position.x / puppy.width - 0.5) * 10)) : 0
            Behavior on angle { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }
        }
        HoverHandler { id: puppyHover }
    }
    ColumnLayout {
        anchors.left: parent.left; anchors.top: parent.top; anchors.bottom: parent.bottom
        anchors.leftMargin: 28
        anchors.topMargin: 25; anchors.bottomMargin: 25
        width: card.width < 550 ? card.width - 56 : card.width * 0.55; spacing: 10
        Rectangle {
            radius: Theme.radiusPill; color: Qt.rgba(1, 1, 1, 0.6)
            implicitWidth: kicker.implicitWidth + 22; implicitHeight: 26
            LabelText { id: kicker; anchors.centerIn: parent; text: "日常护理  ·  演示模式"; font.pixelSize: 11; font.bold: true; color: "#a2663a" }
        }
        LabelText { text: "爪部清洁"; font.pixelSize: Theme.fsTitle; font.bold: true }
        LabelText { text: App.step < 0 ? App.runStatus : App.paused ? "已暂停 · " + App.steps[App.step] : "正在进行 · " + App.steps[App.step]; font.pixelSize: 15; color: "#806352"; wrapMode: Text.Wrap; Layout.fillWidth: true }
        Item {
            Layout.fillWidth: true; Layout.preferredHeight: 42; visible: App.step >= 0
            LabelText { text: "0" + (App.step + 1) + "  /  06"; color: Theme.progress; font.pixelSize: 12; font.bold: true }
            Rectangle {
                id: progressTrack
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: 8; radius: 4; color: Qt.rgba(1, 1, 1, 0.65); clip: true
                Rectangle {
                    height: parent.height; width: parent.width * (App.step + 1) / 6; radius: 4
                    color: Theme.primaryEnd
                    Behavior on width { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
                }
                Rectangle {
                    width: 45; height: parent.height; radius: 4; color: "#fff4e9"; opacity: 0.55
                    SequentialAnimation on x {
                        running: App.step >= 0; paused: App.paused; loops: Animation.Infinite
                        NumberAnimation { from: -45; to: progressTrack.width; duration: 1700; easing.type: Easing.InOutQuad }
                    }
                }
            }
        }
        Item { Layout.fillHeight: true }
        RowLayout {
            Layout.fillWidth: true; Layout.maximumWidth: 430; spacing: 8
            ActionButton { text: App.step < 0 ? "开始清洁" : App.paused ? "继续清洁" : "清洁进行中"; primary: true; enabled: App.step < 0 || App.paused; Layout.fillWidth: true; onClicked: App.startCleaning() }
            ActionButton { text: "暂停"; enabled: App.step >= 0 && !App.paused; Layout.preferredWidth: 76; onClicked: App.pauseCleaning() }
            ActionButton { text: "停止"; danger: true; enabled: App.step >= 0; Layout.preferredWidth: 76; onClicked: stopDialog.open() }
        }
    }
    Dialog {
        id: stopDialog; title: "停止清洁"; modal: true; anchors.centerIn: Overlay.overlay
        standardButtons: Dialog.Ok | Dialog.Cancel; onAccepted: App.stopCleaning()
        LabelText { text: "确定结束当前清洁流程吗？" }
    }
}
