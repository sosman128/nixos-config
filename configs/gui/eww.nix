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
            backgroundColor = "#89dceb";
            fontColor = "#313244";
            fontWeight = "700";
          };

          workspaceIndicator = {
            backgroundColor = "#eba0ac";
            fontColor = "#313244";
            fontWeight = "700";
          };

          volumeIndicator = {
            backgroundColor = "#b4befe";
            fontColor = "#313244";
            fontWeight = "700";
          };
        in
        ''
        (defpoll workspace-number
          :interval "0.1s"
          :initial "1"
          `niri msg workspaces | grep "*" | cut -c 4`)
        (defpoll volume
          :interval "0.1s"
          :initial "10%"
          `echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -c9-)"`)
        (defpoll hour
          :interval "0.1s"
          :initial "1"
          `date +%H`)
        (defpoll minute
          :interval "0.1s"
          :initial "1"
          `date +%M`)
        (defwidget workspace-indicator []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text workspace-number
             :valign "start"
             :css "label
               {background-color: ${workspaceIndicator.backgroundColor};
                color:${workspaceIndicator.fontColor};
                font-weight:${workspaceIndicator.fontWeight}; }")))
        (defwidget volume-indicator []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text volume
             :valign "start"
             :css "label
              {background-color: ${volumeIndicator.backgroundColor};
              color:${volumeIndicator.fontColor};
              font-weight:${volumeIndicator.fontWeight}; }")))
        (defwidget clock []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text hour
             :valign "start"
             :css "label
              {background-color:${clock.backgroundColor} ;
              color:${clock.fontColor} ;
              font-weight:${clock.fontWeight} ; }")
            (label
              :text minute
              :valign "start"
              :css "label
                {background-color: ${clock.backgroundColor};
                color:${clock.fontColor} ;
                font-weight:${clock.fontWeight} ;}")))
        (defwindow panel
          :monitor 0
          :geometry
            (geometry
              :x "0%"
              :y "20px"
              :width "${panel.width}"
              :height "${panel.height}"
              :anchor "${panel.anchor}")
          :stacking "fg"
          :exclusive true
        (centerbox
          :orientation "v"
          :space-evenly false
          :vexpand true
          (clock
            :valign "start")
          (label
            :text ""
            :valign "center")
          (box
            :orientation "v"
            :space-evenly false
            :valign "end"
            (volume-indicator
              :valign "end")
            (workspace-indicator
              :valign "end"))))
        '';
    };
}
