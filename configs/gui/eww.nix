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
      home.file.".config/eww/eww.yuck".text =
        let
          panel = {
            anchor = "left center";
            width = "30px";
            height = "100%";
          };

          clock = {
            backgroundColor = "#585b70";
          };

          workspaceIndicator = {
            backgroundColor = "#585b70";
          };

          volumeIndicator = {
            backgroundColor = "#585b70";
          };
        in
        ''
        (defpoll workspace-number :interval "0.1s"
                                  :initial "1"
                                  `niri msg workspaces | grep "*" | cut -c 4`)
        (defpoll volume :interval "0.1s"
                        :initial "10%"
                        `wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -c9-`)
        (defpoll hour :interval "0.1s"
                      :initial "1"
                      `date +%H`)
        (defpoll minute :interval "0.1s"
                        :initial "1"
                        `date +%M`)
        (defwidget workspace-indicator []
                   (box :orientation "v"
                        :space-evenly false
                   (label :text workspace-number :valign "start" :css "label {background-color: ${workspaceIndicator.backgroundColor};}")))
        (defwidget volume-indicator []
                   (box :orientation "v"
                        :space-evenly false
                   (label :text volume :valign "start" :css "label {background-color: ${volumeIndicator.backgroundColor};}")))
        (defwidget clock []
                   (box :orientation "v"
                        :space-evenly false
                   (label :text hour :valign "start" :css "label {background-color: ${clock.backgroundColor};}")
                   (label :text minute :valign "start" :css "label {background-color: ${clock.backgroundColor};}")))
        (defwindow panel :monitor 0
                         :geometry (geometry :x "0%"
                                             :y "20px"
                                             :width "${panel.width}"
                                             :height "${panel.height}"
                                             :anchor "${panel.anchor}")
                         :stacking "fg"
                         :exclusive true
        (centerbox :orientation "v"
                   :space-evenly false
                   :vexpand true
                   (clock :valign "start")
                   (label :text "" :valign "center")
                   (box :orientation "v"
                        :space-evenly false
                        :valign "end"
                   (volume-indicator :valign "end")
                   (workspace-indicator :valign "end"))))
        '';
    };
}
