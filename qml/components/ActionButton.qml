import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Button {
    id: button
    property bool primary: false
    property bool danger: false
    implicitHeight: 46
    hoverEnabled: true

    HoverHandler { cursorShape: button.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor }

    background: Rectangle {
        radius: height / 2
        color: !button.enabled ? "#f1e6dd"
             : button.primary ? (button.down ? "#d9683c" : button.hovered ? "#f08658" : Theme.primaryEnd)
             : button.danger ? (button.down ? "#f6d5d0" : button.hovered ? "#f9ddd9" : "#fceae7")
             : (button.down ? "#f6ebe1" : button.hovered ? "#fff4ea" : "#fffdfc")
        border.color: button.primary ? "transparent" : button.danger ? "#f3cbc5" : "#eddbcd"
        scale: button.down ? 0.97 : 1
        Behavior on scale { NumberAnimation { duration: 90; easing.type: Easing.OutQuad } }
        Behavior on color { ColorAnimation { duration: 120 } }
    }
    contentItem: Text {
        text: button.text
        color: !button.enabled ? "#ae9c90" : button.primary ? "white" : button.danger ? "#b65e56" : Theme.ink
        font.family: Theme.fontFamily; font.pixelSize: Theme.fsBody; font.bold: true
        horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
    }
}
