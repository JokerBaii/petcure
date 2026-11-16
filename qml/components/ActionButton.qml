import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Button {
        id: button
        property bool primary: false
        property bool danger: false
        implicitHeight: 44
        background: Rectangle { radius: 13; color: !button.enabled ? "#eee8e2" : button.primary ? Theme.coral : button.danger ? "#f9e8e4" : "#fff9f3"; border.color: button.primary ? "#e48078" : "#eeddd0" }
        contentItem: Text { text: button.text; color: !button.enabled ? "#b8aba0" : button.primary ? "white" : button.danger ? "#b65e56" : Theme.ink; font.family: Theme.fontFamily; font.pixelSize: 14; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
    }
