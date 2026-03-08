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
            backgroundColor = "#fab387";
            fontColor = "#313244";
            fontWeight = "700";
          };

          calendar = {
            backgroundColor = "#94e2d5";
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

          keyboardLayoutIndicator = {
            backgroundColor = "#a6e3a1";
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
          :initial "10"
          `x=$(wpctl get-volume @DEFAULT_SINK@); if [[ $x != "Volume: 0.00" ]]; then echo $(echo $(wpctl get-volume @DEFAULT_SINK@ | sed 's/.* //') '* 100' | bc | rev | cut -c 4- | rev); else echo 0; fi`)
        (defpoll hour
          :interval "0.1s"
          :initial "1"
          `date +%H`)
        (defpoll minute
          :interval "0.1s"
          :initial "1"
          `date +%M`)
        (defpoll month
          :interval "0.1s"
          :initial "03"
          `date +%m`)
        (defpoll day
          :interval "0.1s"
          :initial "01"
          `date +%d`)
        (defpoll keyboard-layout
          :interval "0.1s"
          :initial "us"
          `niri msg keyboard-layouts | grep "*" | cut -c6- | cut -c-2 | tr [:upper:] [:lower:]`)
        (defwidget keyboard-layout-indicator []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text keyboard-layout
             :valign "start"
             :css "label
              {background-color:${keyboardLayoutIndicator.backgroundColor};
              color:${keyboardLayoutIndicator.fontColor};
              font-weight:${keyboardLayoutIndicator.fontWeight};}")))
        (defwidget workspace-indicator []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text workspace-number
             :valign "start"
             :css "label
               {background-color:${workspaceIndicator.backgroundColor};
                color:${workspaceIndicator.fontColor};
                font-weight:${workspaceIndicator.fontWeight};}")))
        (defwidget volume-indicator []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text volume
             :valign "start"
             :css "label
              {background-color:${volumeIndicator.backgroundColor};
              color:${volumeIndicator.fontColor};
              font-weight:${volumeIndicator.fontWeight};}")))
        (defwidget clock []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text hour
             :valign "start"
             :css "label
              {background-color:${clock.backgroundColor};
              color:${clock.fontColor};
              font-weight:${clock.fontWeight};}")
            (label
              :text minute
              :valign "start"
              :css "label
                {background-color:${clock.backgroundColor};
                color:${clock.fontColor};
                font-weight:${clock.fontWeight};}")))
        (defwidget calendar2 []
          (box
            :orientation "v"
            :space-evenly false
            (label
             :text month
             :valign "start"
             :css "label
              {background-color:${calendar.backgroundColor};
              color:${calendar.fontColor};
              font-weight:${calendar.fontWeight};}")
            (label
              :text day
              :valign "start"
              :css "label
                {background-color:${calendar.backgroundColor};
                color:${calendar.fontColor};
                font-weight:${calendar.fontWeight};}")))
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
          (box
            :orientation "v"
            :space-evenly false
            :valign "start"
            (calendar2
              :valign "start")
            (clock
              :valign "start"))
          (label
            :text ""
            :valign "center")
          (box
            :orientation "v"
            :space-evenly false
            :valign "end"
            (volume-indicator
              :valign "end")
            (keyboard-layout-indicator
              :valign "end")
            (workspace-indicator
              :valign "end"))))
        '';
    };
}
