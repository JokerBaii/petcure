pragma Singleton
import QtQuick

QtObject {
    property int page: 0
    property int step: -1
    property bool paused: false
    property int count: 0
    property string lastTime: "暂无"
    property var records: []
    readonly property var names: ["设备总览", "清洁控制", "传感器监测", "自动流程", "安全保护", "数据记录"]
    readonly property var steps: ["犬爪进入检测", "柔性缓降与包覆", "定点微雾润湿", "垂直脉冲清洁", "卷对卷耗材输送", "结束与安全复位"]
    readonly property string runStatus: step < 0 ? "待机中" : paused ? "已暂停" : "清洁中"

    function startCleaning() {
        if (step < 0) step = 0
        paused = false
    }
    function pauseCleaning() { paused = true }
    function stopCleaning() { step = -1; paused = false }

    property Timer demoTimer: Timer {
        interval: 3500
        running: App.step >= 0 && !App.paused
        repeat: true
        onTriggered: {
            if (App.step < 5) App.step++
            else {
                App.step = -1
                App.count++
                App.lastTime = Qt.formatDateTime(new Date(), "HH:mm")
                App.records = [{ time: App.lastTime, result: "已完成" }].concat(App.records)
            }
        }
    }
}
