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
      gtk = {
        enable = true;

        theme = {
          name = "Catppuccin-GTK-Dark";
          package = pkgs.magnetic-catppuccin-gtk;
        };

        iconTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };

        colorScheme = "dark";
      };
    };
}
