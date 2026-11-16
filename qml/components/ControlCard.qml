import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."
Card {
    id: card
    implicitHeight: 250
    color: "#f8e6d9"; border.color: "#f3dfd1"; clip: true
    Image {
        id: scene
        visible: card.width >= 900
        anchors.fill: parent; source: "../../assets/images/welcome-banner.png"
        fillMode: Image.PreserveAspectCrop; asynchronous: true
    }
    Rectangle { visible: card.width >= 520 && !scene.visible; width: 240; height: 240; radius: 120; color: "#f2d6c2"; anchors.right: parent.right; anchors.rightMargin: -25; anchors.verticalCenter: parent.verticalCenter }
    Item {
        id: motion
        visible: card.width >= 520 && App.step >= 0
        anchors.right: parent.right; anchors.rightMargin: 10; anchors.verticalCenter: parent.verticalCenter
        width: Math.min(card.width * 0.38, 235); height: card.height
        Repeater {
            model: 3
            delegate: Rectangle {
                required property int index
                anchors.centerIn: parent; width: 190; height: 190; radius: 95
                color: "transparent"; border.width: 2; border.color: "#d9a98e"
                opacity: Math.max(0, 0.65 * (1.35 - scale))
                SequentialAnimation on scale {
                    running: App.step >= 0; paused: App.paused; loops: Animation.Infinite
                    PauseAnimation { duration: index * 600 }
                    NumberAnimation { from: 0.45; to: 1.35; duration: 2200; easing.type: Easing.OutCubic }
                }
            }
        }
        Repeater {
            model: 5
            delegate: Rectangle {
                required property int index
                x: 18 + index * 42; y: motion.height - 26
                width: 8 + (index % 3) * 4; height: width; radius: width / 2
                color: index % 2 ? "#fffaf4" : "#f2b7a3"; opacity: 0.75
                SequentialAnimation on y {
                    running: App.step >= 0; paused: App.paused; loops: Animation.Infinite
                    PauseAnimation { duration: index * 360 }
                    NumberAnimation { from: motion.height - 24; to: 15; duration: 2300 + index * 160; easing.type: Easing.OutQuad }
                }
            }
        }
    }
    Image {
        id: puppy
        visible: card.width >= 520 && !scene.visible
        source: "../../assets/images/cleaning-puppy.png"; fillMode: Image.PreserveAspectFit
        anchors.right: parent.right; anchors.rightMargin: 4; anchors.bottom: parent.bottom
        width: Math.min(parent.width * 0.38, 235); height: parent.height * 0.88; asynchronous: true
        transformOrigin: Item.Bottom
        SequentialAnimation on rotation {
            running: App.step >= 0; paused: App.paused; loops: Animation.Infinite
            NumberAnimation { to: 3; duration: 1100; easing.type: Easing.InOutSine }
            NumberAnimation { to: -3; duration: 1100; easing.type: Easing.InOutSine }
            onStopped: puppy.rotation = 0
        }
    }
    ColumnLayout {
        anchors.left: parent.left; anchors.top: parent.top; anchors.bottom: parent.bottom
        anchors.leftMargin: scene.visible ? card.width * 0.35 : 25
        anchors.topMargin: 25; anchors.bottomMargin: 25
        width: scene.visible ? card.width * 0.39 : card.width < 520 ? card.width - 50 : card.width * 0.58; spacing: 10
        LabelText { text: "爪部清洁"; font.pixelSize: 22; font.bold: true }
        LabelText { text: App.step < 0 ? App.runStatus : App.paused ? "已暂停 · " + App.steps[App.step] : "正在进行 · " + App.steps[App.step]; font.pixelSize: 15; color: "#986e59"; wrapMode: Text.Wrap; Layout.fillWidth: true }
        Item {
            Layout.fillWidth: true; Layout.preferredHeight: 42; visible: App.step >= 0
            LabelText { text: "0" + (App.step + 1) + "  /  06"; color: "#a67863"; font.pixelSize: 12 }
            Rectangle {
                id: progressTrack
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: 5; radius: 3; color: "#ead0c1"; clip: true
                Rectangle {
                    height: parent.height; width: parent.width * (App.step + 1) / 6; radius: 3; color: "#c77b5d"
                    Behavior on width { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
                }
                Rectangle {
                    width: 45; height: 5; radius: 3; color: "#fff4e9"; opacity: 0.65
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
            ActionButton { text: "暂停"; enabled: App.step >= 0 && !App.paused; Layout.preferredWidth: 72; onClicked: App.pauseCleaning() }
            ActionButton { text: "停止"; danger: true; enabled: App.step >= 0; Layout.preferredWidth: 72; onClicked: stopDialog.open() }
        }
    }
    Dialog {
        id: stopDialog; title: "停止清洁"; modal: true; anchors.centerIn: Overlay.overlay
        standardButtons: Dialog.Ok | Dialog.Cancel; onAccepted: App.stopCleaning()
        LabelText { text: "确定结束当前清洁流程吗？" }
    }
}
