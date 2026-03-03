{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  home-manager.users.sosman64 =
    {
      pkgs,
      config,
      lib,
      ...
    }:

    {
      programs.alacritty.enable = true;

      programs.alacritty.theme = "catppuccin_mocha";
    };
}
