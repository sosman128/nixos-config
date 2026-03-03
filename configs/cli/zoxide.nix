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
      programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
      };

      home.shellAliases = {
        cd = "z";
        cdi = "zi";
      };
    };
}
