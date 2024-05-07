const NiriMapWest = () => Widget.Box({
  vertical: true,
  spacing: 8,
  children: [
  ]
});

const NiriMapCenter = () => Widget.Box({
  vertical: true,
  spacing: 8,
  children: [
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("------------------------"),
    Widget.Label("++++++++++++++++++++++++"),
    Widget.Label("++++++++++++++++++++++++"),
    Widget.Label("++++++++++++++++++++++++"),
  ],
  css: "background-color: #CBA6F7FF;",
});

const NiriMapEast = () => Widget.Box({
    vertical: true,
    spacing: 8,
    children: [
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
      Widget.Label("------------------------"),
    ]
});

export function NiriMap(monitor = 0) {
  return Widget.Window({
    name: `nirimap-${monitor}`,
    class_name: "nirimap",
    monitor,
    anchor: ["bottom", "right"],
    exclusivity: "ignore",
    layer: "overlay",
    child: Widget.CenterBox({
      vertical: false,
      spacing: 8,
      startWidget: NiriMapWest(),
      centerWidget: NiriMapCenter(),
      endWidget: NiriMapEast(),
    }),
    css: "background-color: rgba(30, 30, 46, 0.5);",
  })
}
