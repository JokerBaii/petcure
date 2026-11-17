import QtQuick
import QtQuick.Layouts
import ".."
Card {
    implicitHeight: 300
    ColumnLayout {
        anchors.fill: parent; anchors.margins: 22; spacing: 12
        RowLayout {
            Layout.fillWidth: true
            ColumnLayout { Layout.fillWidth: true; spacing: 4
                SectionTitle { text: "传感器趋势" }
                SmallText { text: "示意曲线 · 演示数据" }
            }
            Rectangle { radius: Theme.radiusPill; color: Theme.chip; implicitWidth: 84; implicitHeight: 28
                SmallText { anchors.centerIn: parent; text: "示意" }
            }
        }
        Rectangle {
            Layout.fillWidth: true; Layout.fillHeight: true; radius: 16; color: "#faf7f3"; clip: true
            Canvas {
                id: chart
                anchors.fill: parent; anchors.margins: 14
                readonly property var series: [
                    { line: "#e99b91", top: "rgba(233,155,145,0.32)", data: [0.62, 0.64, 0.63, 0.66, 0.65, 0.67, 0.66, 0.68, 0.67, 0.66] },
                    { line: "#86bfc9", top: "rgba(134,191,201,0.32)", data: [0.30, 0.34, 0.31, 0.36, 0.33, 0.35, 0.32, 0.34, 0.33, 0.35] }
                ]
                onWidthChanged: requestPaint()
                onHeightChanged: requestPaint()
                onPaint: {
                    const ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "#efe3d8"; ctx.lineWidth = 1
                    for (let g = 0; g < 4; g++) {
                        const gy = Math.round((height - 1) * g / 3) + 0.5
                        ctx.beginPath(); ctx.moveTo(0, gy); ctx.lineTo(width, gy); ctx.stroke()
                    }
                    for (const s of series) {
                        const n = s.data.length
                        const pts = s.data.map((v, i) => ({ x: width * i / (n - 1), y: height * (1 - v) }))
                        ctx.beginPath()
                        pts.forEach((p, i) => { if (i === 0) ctx.moveTo(p.x, p.y); else ctx.lineTo(p.x, p.y) })
                        ctx.lineTo(width, height); ctx.lineTo(0, height); ctx.closePath()
                        const grad = ctx.createLinearGradient(0, 0, 0, height)
                        grad.addColorStop(0, s.top); grad.addColorStop(1, "rgba(255,255,255,0)")
                        ctx.fillStyle = grad; ctx.fill()
                        ctx.beginPath()
                        pts.forEach((p, i) => { if (i === 0) ctx.moveTo(p.x, p.y); else ctx.lineTo(p.x, p.y) })
                        ctx.strokeStyle = s.line; ctx.lineWidth = 2.5; ctx.lineJoin = "round"; ctx.stroke()
                    }
                }
            }
        }
    }
}
