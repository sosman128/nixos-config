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
            {
              mod = "SUPER";
              key = "q";
              command = "quit";
            }
            {
              mod = "SUPER";
              key = "t";
              command = "spawn, konsole";
            }
          ];
        in
        ''
          ${builtins.concatStringsSep "\n" (builtins.map keybind keybind-list)}
        '';
    };
}
