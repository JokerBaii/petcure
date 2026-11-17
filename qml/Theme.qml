pragma Singleton
import QtQuick

QtObject {
    readonly property string fontFamily: "Noto Sans CJK SC"

    // text
    readonly property color ink: "#493528"
    readonly property color muted: "#806b5d"
    readonly property color coral: "#b65c19"
    readonly property color progress: "#a55f47"

    // surfaces
    readonly property color bg: "#fff6ec"
    readonly property color sidebar: "#f8e8d9"
    readonly property color navHover: "#f9dfc8"
    readonly property color surface: "#fffaf5"
    readonly property color border: "#f0e1d4"
    readonly property color chip: "#f6eee8"
    readonly property color accent: "#f5ad62"

    // primary gradient (buttons, active nav, progress)
    readonly property color primaryEnd: "#e9784a"

    // status
    readonly property color ok: "#52785c"
    readonly property color okBg: "#e7f1e7"
    readonly property color okDot: "#63a176"
    readonly property color warnDot: "#e0a85a"
    readonly property color idleDot: "#c9b8aa"

    // semantic tints for metric cards: background / foreground
    readonly property color mintBg: "#e8f4ea"
    readonly property color mintFg: "#3f7a52"
    readonly property color creamBg: "#fff1dc"
    readonly property color creamFg: "#a8662a"
    readonly property color aquaFg: "#2f7f89"
    readonly property color roseFg: "#c0594c"
    readonly property color skyFg: "#4a6fa5"

    // kawaii outline
    readonly property color outline: "#e8cdb8"


    // type scale
    readonly property int fsTitle: 28
    readonly property int fsHeading: 18
    readonly property int fsBody: 14
    readonly property int fsCaption: 12

    // shape and spacing
    readonly property int radiusLg: 28
    readonly property int radiusPill: 999
    readonly property int pagePadding: 32
}
