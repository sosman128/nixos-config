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
      programs.bash.enable = true;

      # --- HOME
      home.shellAliases = {
        nrb = "sudo nixos-rebuild switch --no-reexec";
        ngc = "sudo nix-collect-garbage --delete-older-than 1d && sudo /run/current-system/bin/switch-to-configuration boot";
      };
    };
}
