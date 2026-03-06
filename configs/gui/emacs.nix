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
      programs.emacs = {
        enable = true;
        package = pkgs.emacs-pgtk;
      };
    };
}
