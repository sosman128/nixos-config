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
        platformTheme.name = "qtct";
        style = {
          name = "catppuccin-mocha-mauve";
          package =  pkgs.catppuccin-qt5ct;
        };
      };
    };
}
