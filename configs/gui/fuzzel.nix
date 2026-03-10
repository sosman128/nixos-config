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
      programs.fuzzel = {
        enable = true;

        settings = {
          main = {
            terminal = "${pkgs.alacritty}/bin/alacritty";
            prompt = "";
          };
          colors = {
            background = "#1e1e2eff";
            border = "#eba0acff";
            text = "#cdd6f4ff";
            selected = "#181825ff";
          };
        };
      };
    };
}
