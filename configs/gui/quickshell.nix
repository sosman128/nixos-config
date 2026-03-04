{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home-manager.users.sosman64 =
    {
      pkgs,
      lib,
      config,
      ...
    }:

    {
      programs.quickshell.enable = true;

      home.file.".config/quickshell/shell.qml".text =
        let
          foo = "bar";
        in
          ''
          import Quickshell
          import Quickshell.Wayland
          import QtQuick
          import QtQuick.Layouts

          PanelWindow {
            anchors {
              top: true
              left: true
              bottom: true
            }
            implicitWidth: 25
            color: "#181825"
            ColumnLayout {
              anchors.fill: parent
              Text {
                text: "balls"
                color: "#cdd6f4"
                font.pixelSize: 14
              }
              Item { Layout.fillHeight: true }
              Text {
                text: "a"
                color: "#cdd6f4"
                font.pixelSize: 14
              }
            }
          }
          '';
    };
}
