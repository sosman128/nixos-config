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
      home.file.".config/niri/config.kdl".text =
        let
          preferNoCSD = true;

          defaultColumnWidth = "0.5";

          shadowColor = "#181926";

          cornerRadius = "7";

          cursor = {
            theme = "Vimix-white-cursors";
            size = "36";
          };

          xkb = {
            options = "caps:super,grp:win_space_toggle";
            layout = "us,eg";
          };

          layout = {
            gaps = "8";
            centerFocusedColumn = "never";
          };

          border = {
            width = "4";
            colors = {
              active = "#ee99a0";
              inactive = "#939ab7";
              urgent = "#ed8796";
            };
          };

          proportions = [
            "0.33333"
            "0.5"
            "0.66667"
            "1.0"
          ];

          keybinds = [
            { key = "Mod+Alt+E"; command = "spawn \"alacritty\";"; }
            { key = "Mod+E"; command = "spawn \"fuzzel\";"; }
            { key = "Mod+H"; command = "focus-column-left;"; }
            { key = "Mod+J"; command = "focus-window-down;"; }
            { key = "Mod+K"; command = "focus-window-up;"; }
            { key = "Mod+L"; command = "focus-column-right;"; }
            { key = "Mod+U"; command = "focus-workspace-down;"; }
            { key = "Mod+I"; command = "focus-workspace-up;"; }
            { key = "Mod+Alt+H"; command = "move-column-left;"; }
            { key = "Mod+Alt+J"; command = "move-window-down;"; }
            { key = "Mod+Alt+K"; command = "move-window-up;"; }
            { key = "Mod+Alt+L"; command = "move-column-right;"; }
            { key = "Mod+Alt+U"; command = "move-column-to-workspace-down;"; }
            { key = "Mod+Alt+I"; command = "move-column-to-workspace-up;"; }
            { key = "Mod+N"; command = "consume-or-expel-window-left;"; }
            { key = "Mod+M"; command = "consume-or-expel-window-right;"; }
            { key = "Mod+D repeat=false"; command = "toggle-overview;"; }
            { key = "Mod+Q repeat=false"; command = "close-window;"; }
            { key = "Mod+Alt+Q"; command = "quit;"; }
            { key = "Mod+W"; command = "switch-preset-column-width;"; }
            { key = "Mod+Alt+W"; command = "fullscreen-window;"; }
            { key = "Print"; command = "screenshot;";}
            { key = "Alt+Print"; command = "screenshot-window;";}
            { key = "XF86AudioRaiseVolume allow-when-locked=true"; command = "spawn-sh \"wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0\";"; }
            { key = "XF86AudioLowerVolume allow-when-locked=true"; command = "spawn-sh \"wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-\";"; }
            { key = "XF86AudioMute allow-when-locked=true"; command = "spawn-sh \"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\";"; }
            { key = "XF86AudioMicMute allow-when-locked=true"; command = "spawn-sh \"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\";"; }
            { key = "XF86AudioPlay allow-when-locked=true"; command = "spawn-sh \"playerctl play-pause\";"; }
            { key = "XF86AudioStop allow-when-locked=true"; command = "spawn-sh \"playerctl stop\";"; }
            { key = "XF86AudioPrev allow-when-locked=true"; command = "spawn-sh \"playerctl previous\";"; }
            { key = "XF86AudioNext allow-when-locked=true"; command = "spawn-sh \"playerctl next\";"; }
            { key = "XF86MonBrightnessUp allow-when-locked=true"; command = "spawn \"brightnessctl\" \"--class=backlight\" \"set\" \"+10%\";"; }
            { key = "XF86MonBrightnessDown allow-when-locked=true"; command = "spawn \"brightnessctl\" \"--class=backlight\" \"set\" \"10%-\";"; }
          ];

          startup = [
            { name = "dunst"; }
            { name = "swaybg -i /etc/nixos/resources/niri/wallpaper-blur.png"; shell = true; }
            { name = "swww-daemon"; }
            { name = "swww img /etc/nixos/resources/niri/wallpaper.png"; shell = true; }
            { name = "eww open panel"; shell = true; }
          ];
        in
          ''
           cursor {
             xcursor-theme "${cursor.theme}"
             xcursor-size ${cursor.size}
           }
          layer-rule {
            match namespace="^wallpaper$"
            place-within-backdrop true
          }
          window-rule {
            geometry-corner-radius ${cornerRadius}
            clip-to-geometry true
          }
          ${if preferNoCSD then "prefer-no-csd" else ""}
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
            default-column-width { proportion ${defaultColumnWidth}; }
            focus-ring {
              off
            }
            border {
              width ${border.width}
              active-color "${border.colors.active}"
              inactive-color "${border.colors.inactive}"
              urgent-color "${border.colors.urgent}"
            }
            shadow {
              color "${shadowColor}"
            }
          }
          ${startup |> builtins.map ({name, shell ? false}: "${if shell then "spawn-sh-at-startup" else "spawn-at-startup"} \"${name}\"") |> builtins.concatStringsSep "\n"}
          hotkey-overlay {
            skip-at-startup
          }
          screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
          binds {
            ${builtins.map ({key,command}: "\t${key} { ${command} }") keybinds |> builtins.concatStringsSep "\n"}
          }
        '';
    };
}
