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
      programs.eza = {
        enable = true;
        enableBashIntegration = true;
        colors = "auto";
        icons = "auto";
      };

      home.shellAliases = {
        ls = "eza";
        tree = "eza --tree";
      };
    };
}
