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
        in
        ''
        (defpoll workspace-number :interval "0.1s"
                                  :initial "1"
                                  `niri msg workspaces | grep "*" | cut -c 4`)
        (defpoll hour :interval "0.1s"
                      :initial "1"
                      `date +%H`)
        (defpoll minute :interval "0.1s"
                        :initial "1"
                        `date +%M`)
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
                   (label :text workspace-number :valign "end":css "label {background-color: #585b70;}")))
        '';
    };
}
