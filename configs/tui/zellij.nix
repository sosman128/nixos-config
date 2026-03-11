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
      programs.zellij = {
        enable = true;
        settings.theme = "catppuccin-mocha";
      };
    };
}
