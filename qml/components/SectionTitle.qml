import QtQuick
import QtQuick.Layouts
import ".."
RowLayout {
    property alias text: heading.text
    LabelText { id: heading; font.pixelSize: 18; font.bold: true }
    Item { Layout.fillWidth: true }
}
