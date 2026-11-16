import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."
import "../components"

ColumnLayout { spacing: 16
            RowLayout { Layout.fillWidth: true
                SafetyCard { Layout.fillWidth: true; Layout.preferredWidth: 6; Layout.preferredHeight: 250 }
                Card { Layout.fillWidth: true; Layout.preferredWidth: 4; Layout.preferredHeight: 250; color: "#fff2e9"
                    RowLayout { anchors.fill: parent; anchors.margins: 20
                        ColumnLayout { Layout.fillWidth: true; LabelText { text: "安心守护"; font.pixelSize: 20; font.bold: true } SmallText { text: "陪伴，是最温柔的保护"; wrapMode: Text.Wrap; Layout.fillWidth: true } }
                        Image { source: "../../assets/images/safety-puppy.png"; fillMode: Image.PreserveAspectFit; Layout.preferredWidth: parent.width * 0.55; Layout.fillHeight: true; asynchronous: true }
                    }
                }
            }
            Card { Layout.fillWidth: true; implicitHeight: 180
                ColumnLayout { anchors.fill: parent; anchors.margins: 22; spacing: 14
                    SectionTitle { text: "报警信息"; Layout.fillWidth: true }
                    LabelText { text: "✓   当前没有模拟报警"; color: "#78aa82"; font.pixelSize: 16 }
                }
            }
        }
