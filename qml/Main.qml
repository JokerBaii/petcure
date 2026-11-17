import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

ApplicationWindow {
    id: root
    width: 1440; height: 900; minimumWidth: 900; minimumHeight: 650
    visible: true; title: "爪净智控"; color: Theme.bg

    readonly property bool compact: width < 1100
    readonly property int pageMargin: compact ? 24 : Theme.pagePadding
    readonly property var navIcons: ["dashboard", "cleaning_services", "monitoring", "route", "shield", "history"]
    readonly property var pages: ["pages/OverviewPage.qml", "pages/ControlsPage.qml", "pages/SensorsPage.qml", "pages/FlowPage.qml", "pages/SafetyPage.qml", "pages/RecordsPage.qml"]

    RowLayout {
        anchors.fill: parent; spacing: 0

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: root.compact ? 84 : 232
            color: Theme.sidebar
            Behavior on Layout.preferredWidth { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
            ColumnLayout {
                anchors.fill: parent; anchors.margins: 16; spacing: 6
                RowLayout {
                    Layout.alignment: root.compact ? Qt.AlignHCenter : Qt.AlignLeft
                    Layout.leftMargin: root.compact ? 0 : 6; Layout.topMargin: 14; Layout.bottomMargin: 28; spacing: 10
                    Rectangle {
                        Layout.preferredWidth: 38; Layout.preferredHeight: 38; radius: 13
                        color: Theme.accent
                        Image { anchors.centerIn: parent; width: 22; height: 22; source: "../assets/icons/pets.svg" }
                    }
                    LabelText { visible: !root.compact; text: "爪净智控"; font.pixelSize: 23; font.bold: true }
                }
                Repeater {
                    model: App.names
                    delegate: Rectangle {
                        id: navItem
                        required property int index
                        required property string modelData
                        readonly property bool active: App.page === index
                        Layout.fillWidth: true; Layout.preferredHeight: 48; radius: 24
                        color: active ? Theme.surface : navHover.hovered ? Theme.navHover : "transparent"
                        border.width: active ? 2 : 0; border.color: Theme.outline
                        Behavior on color { ColorAnimation { duration: 120 } }
                        Accessible.role: Accessible.Button
                        Accessible.name: modelData
                        ToolTip.visible: navHover.hovered && root.compact
                        ToolTip.text: modelData
                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: root.compact ? undefined : parent.left
                            anchors.horizontalCenter: root.compact ? parent.horizontalCenter : undefined
                            anchors.leftMargin: 19; spacing: 13
                            Image { source: "../assets/icons/" + root.navIcons[navItem.index] + ".svg"; width: 21; height: 21; anchors.verticalCenter: parent.verticalCenter }
                            LabelText { visible: !root.compact; text: navItem.modelData; font.pixelSize: 15; font.bold: navItem.active; color: navItem.active ? Theme.coral : Theme.ink; anchors.verticalCenter: parent.verticalCenter }
                        }
                        HoverHandler { id: navHover; cursorShape: Qt.PointingHandCursor }
                        TapHandler { onTapped: App.page = navItem.index }
                    }
                }
                Item { Layout.fillHeight: true }
                LabelText { visible: !root.compact; text: "用心呵护每一步"; color: "#9d7b65"; font.pixelSize: 12; Layout.leftMargin: 10; Layout.bottomMargin: 16 }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true; Layout.fillHeight: true; spacing: 0

            RowLayout {
                Layout.fillWidth: true; Layout.preferredHeight: 72; Layout.topMargin: 16
                Layout.leftMargin: root.pageMargin; Layout.rightMargin: root.pageMargin; spacing: 14
                ColumnLayout {
                    Layout.fillWidth: true; spacing: 2
                    LabelText { text: App.names[App.page]; font.pixelSize: Theme.fsTitle; font.bold: true }
                    LabelText { text: "每一次清洁，都是温柔的呵护"; font.pixelSize: Theme.fsCaption; color: Theme.muted }
                }
                Rectangle {
                    radius: Theme.radiusPill; color: Theme.surface; border.color: Theme.border
                    implicitWidth: statusRow.implicitWidth + 32; implicitHeight: 36
                    Row {
                        id: statusRow; anchors.centerIn: parent; spacing: 8
                        Rectangle {
                            width: 9; height: 9; radius: 5; anchors.verticalCenter: parent.verticalCenter
                            color: App.step < 0 ? Theme.idleDot : App.paused ? Theme.warnDot : Theme.okDot
                            Behavior on color { ColorAnimation { duration: 200 } }
                        }
                        LabelText { text: "设备已连接  ·  " + App.runStatus; font.pixelSize: 13; font.bold: true }
                    }
                }
                LabelText { text: "数据来源：演示"; font.pixelSize: 12; color: Theme.muted }
            }

            ScrollView {
                id: scroll
                Layout.fillWidth: true; Layout.fillHeight: true; clip: true; contentWidth: availableWidth
                ColumnLayout {
                    width: scroll.availableWidth; spacing: 0
                    Loader {
                        id: pageLoader
                        Layout.fillWidth: true; Layout.topMargin: 8
                        Layout.leftMargin: root.pageMargin; Layout.rightMargin: root.pageMargin; Layout.bottomMargin: root.pageMargin
                        source: root.pages[App.page]
                        onLoaded: fadeIn.restart()
                        NumberAnimation { id: fadeIn; target: pageLoader; property: "opacity"; from: 0; to: 1; duration: 220; easing.type: Easing.OutQuad }
                    }
                }
            }
        }
    }
}
