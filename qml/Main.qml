import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

ApplicationWindow {
    id: root
    width: 1440; height: 900; minimumWidth: 900; minimumHeight: 650
    visible: true; title: "爪净智控"; color: "#fff9f1"
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#fff9f1" }
            GradientStop { position: 1; color: "#f5eee7" }
        }
    }

    RowLayout {
        anchors.fill: parent; spacing: 0
        Rectangle {
            Layout.fillHeight: true; Layout.preferredWidth: 220; color: "#f3e9e0"
            ColumnLayout {
                anchors.fill: parent; anchors.margins: 16; spacing: 4
                RowLayout {
                    Layout.leftMargin: 10; Layout.topMargin: 18; Layout.bottomMargin: 34; spacing: 10
                    Rectangle { width: 35; height: 35; radius: 12; color: "#e8c4aa"
                        Image { anchors.centerIn: parent; width: 22; height: 22; source: "../assets/icons/pets.svg" }
                    }
                    LabelText { text: "爪净智控"; font.pixelSize: 23; font.bold: true }
                }
                Repeater {
                    model: App.names
                    delegate: Rectangle {
                        required property int index; required property string modelData
                        Layout.fillWidth: true; Layout.preferredHeight: 48; radius: 24
                        color: App.page === index ? "#e7d8cc" : "transparent"
                        Row {
                            anchors.left: parent.left; anchors.leftMargin: 19; anchors.verticalCenter: parent.verticalCenter; spacing: 13
                            Image { source: "../assets/icons/" + ["dashboard", "cleaning_services", "monitoring", "route", "shield", "history"][index] + ".svg"; width: 21; height: 21; anchors.verticalCenter: parent.verticalCenter }
                            LabelText { text: modelData; font.pixelSize: 15; font.bold: App.page === index; anchors.verticalCenter: parent.verticalCenter }
                        }
                        MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: App.page = index }
                    }
                }
                Item { Layout.fillHeight: true }
                Image { source: "../assets/images/sleeping-puppy.png"; Layout.fillWidth: true; Layout.preferredHeight: 150; fillMode: Image.PreserveAspectFit; asynchronous: true }
            }
        }
        ScrollView {
            Layout.fillWidth: true; Layout.fillHeight: true; clip: true; contentWidth: availableWidth
            ColumnLayout {
                width: parent.width; spacing: 24
                Item { Layout.preferredHeight: 4 }
                RowLayout {
                    Layout.fillWidth: true; Layout.leftMargin: 32; Layout.rightMargin: 32
                    LabelText { text: App.names[App.page]; font.pixelSize: 26; font.bold: true; Layout.fillWidth: true }
                    LabelText { text: "数据来源：演示"; font.pixelSize: 14; color: Theme.muted }
                }
                Loader {
                    Layout.fillWidth: true; Layout.leftMargin: 32; Layout.rightMargin: 32; Layout.bottomMargin: 32
                    Layout.minimumHeight: App.page === 0 ? Math.max(690, root.height - 125) : 0
                    source: ["pages/OverviewPage.qml", "pages/ControlsPage.qml", "pages/SensorsPage.qml", "pages/FlowPage.qml", "pages/SafetyPage.qml", "pages/RecordsPage.qml"][App.page]
                }
            }
        }
    }
}
