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
      qt = {
        enable = true;
        platformTheme = "qtct";
        style = {
          name = "catppuccin-mocha-mauve";
          package =  pkgs.catppuccin-qt5ct;
        };
      };
    };
}
