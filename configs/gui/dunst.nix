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
      services.dunst = {
        enable = true;

        settings.global = {
          width = "500";
          height = "200";
          origin = "top-center";
          progress_bar = "true";
          timeout = "10s";
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
      };
    };
}
