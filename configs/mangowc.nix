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
      # --- HOME
      home.file.".config/mango/config.conf".text =
        let
          keybind =
            {
              mod,
              key,
              command,
            }:
            "bind=${mod},${key},${command}";

          keybind-list = [
            { mod = "SUPER+SHIFT"; key = "q"; command = "quit"; }

            { mod = "SUPER"; key = "q"; command = "killclient"; }
            { mod = "SUPER"; key = "r"; command = "reload_config"; }
            { mod = "SUPER"; key = "t"; command = "spawn,alacritty"; }
            { mod = "SUPER"; key = "s"; command = "spawn_shell,grim -g $(slurp)"; }

            { mod = "SUPER"; key = "bracketleft"; command = "tagtoleft"; }
            { mod = "SUPER"; key = "bracketright"; command = "tagtoright"; }

            { mod = "SUPER"; key = "h"; command = "focusdir,left"; }
            { mod = "SUPER"; key = "j"; command = "focusdir,down"; }
            { mod = "SUPER"; key = "k"; command = "focusdir,up"; }
            { mod = "SUPER"; key = "l"; command = "focusdir,right"; }

            { mod = "SUPER"; key = "u"; command = "exchange_client,left"; }
            { mod = "SUPER"; key = "i"; command = "exchange_client,down"; }
            { mod = "SUPER"; key = "o"; command = "exchange_client,up"; }
            { mod = "SUPER"; key = "p"; command = "exchange_client,right"; }
          ];
        in
        ''
          xkb_rules_options=caps:super

          ${builtins.concatStringsSep "\n" (builtins.map keybind keybind-list)}
        '';
    };
}
