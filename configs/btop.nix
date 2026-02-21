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
      # --- GENERAL
      programs.btop = {
        enable = true;
        settings = {
          color_theme = "horizon";
          vim_keys = true;
        };
      };
    };
}
