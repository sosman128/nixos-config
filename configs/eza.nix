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
      programs.eza = {
        enable = true;
        enableBashIntegration = true;
        colors = "auto";
        icons = "auto";
      };
      home.shellAliases.ls = "eza";
      home.shellAliases.tree = "eza --tree";
    };
}
