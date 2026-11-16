# 爪净智控

宠物犬爪智能清洁设备的 Qt Quick 桌面界面。当前提供六个页面和独立的演示流程，所有展示数值均为模拟数据，不会连接或控制实体设备；记录尚未持久化。

## 构建与运行

需要 CMake、C++17 编译器以及 Qt 6 的 Core、Gui、Qml、Quick、Quick Controls 2 开发组件、对应 QML 运行时模块以及 Qt SVG 图像插件。

```bash
cmake -S . -B build
cmake --build build
./build/petcure
```

QML 和图片通过 Qt 资源系统打包进程序。设备通信、实际联锁、报警和记录存储需在协议及硬件确定后接入。

## 项目结构

- `main.cpp`：应用入口和 QML 引擎。
- `qml/Main.qml`：窗口、导航和页面切换。
- `qml/pages/`：六个业务页面。
- `qml/components/`：卡片、按钮、流程等复用组件。
- `qml/Theme.qml`：共享视觉主题；`qml/App.qml`：导航与演示状态。
- `assets/images/`：界面插画素材。

当前演示状态保存在内存中。接入真实设备时应将通信、联锁和持久化放在 C++ 业务层，并由 QML 订阅其状态，不应将演示数据接入真实控制通道。

导航和数据图标来自 [Google Material Symbols](https://github.com/google/material-design-icons)，按 Apache License 2.0 使用；颜色已调整，许可文本见 `assets/icons/LICENSE`。
