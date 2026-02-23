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
      programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
      };

      # --- HOME
      home.shellAliases.cd = "z";
    };
}
