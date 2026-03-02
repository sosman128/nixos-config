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

    # --- HOME
    {
      home.file.".config/niri/config.kdl".text =
        let
          xkb = {
            options = "caps:super";
            layout = "us,eg";
          };

          layout = {
            gaps = "8";
            centerFocusedColumn = "never";
          };

          proportions = [
            "0.33333"
            "0.5"
            "0.66667"
            "1.0"
          ];

          keybinds = [
            { key = "Mod+T"; command = "spawn \"alacritty\";"; }
            { key = "Mod+H"; command = "focus-column-left;"; }
            { key = "Mod+J"; command = "focus-window-down;"; }
            { key = "Mod+K"; command = "focus-window-down;"; }
            { key = "Mod+L"; command = "focus-column-right;"; }
            { key = "Mod+U"; command = "focus-workspace-down;"; }
            { key = "Mod+I"; command = "focus-workspace-up;"; }
            { key = "Mod+Alt+H"; command = "move-column-left;"; }
            { key = "Mod+Alt+J"; command = "move-window-down;"; }
            { key = "Mod+Alt+K"; command = "move-window-up;"; }
            { key = "Mod+Alt+L"; command = "move-column-right;"; }
            { key = "Mod+Alt+U"; command = "move-column-to-workspace-down;"; }
            { key = "Mod+Alt+I"; command = "move-column-to-workspace-up;"; }
            { key = "Mod+D repeat=false"; command = "toggle-overview;"; }
            { key = "Mod+Q repeat=false"; command = "close-window;"; }
            { key = "Mod+Alt+Q"; command = "quit;"; }
            { key = "Mod+W"; command = "maximize-column;"; }
            { key = "Mod+Alt+W"; command = "fullscreen-window;"; }
            { key = "Print"; command = "screenshot;";}
            { key = "Alt+Print"; command = "screenshot-window;";}
          ];
        in
        ''
          input {
              keyboard {
                  xkb {
                      options "${xkb.options}"
                      layout "${xkb.layout}"
                  }
              }
          }
          layout {
              gaps ${layout.gaps}
              center-focused-column "${layout.centerFocusedColumn}"
              preset-column-widths {
                  ${builtins.concatStringsSep "\n\t" (builtins.map (text: "proportion ${text}") proportions)}
              }
              default-column-width { proportion 0.5; }
              focus-ring {
                  width 4
                  active-color "#7fc8ff"
                  inactive-color "#505050"
              }
              border {
                  width 4
                  active-color "#ffc87f"
                  inactive-color "#505050"
                  urgent-color "#9b0000"
              }
              shadow {
                  color "#0007"
              }
          }

          spawn-at-startup "waybar"
          hotkey-overlay {
              skip-at-startup
          }

          screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
          animations {
          }

          binds {
              XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
              XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
              XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
              XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
              XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
              XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
              XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
              XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }
              XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
              XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }
              ${builtins.map ({key,command}: "\t${key} { ${command} }") keybinds |> builtins.concatStringsSep "\n"}
          }
        '';
    };
}
