{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./configs/starship.nix
    ./configs/fastfetch.nix
    ./configs/btop.nix
    ./configs/eza.nix
    ./configs/srb2.nix
  ];

  # --- USER SETTINGS
  users.users.sosman64 = {
    isNormalUser = true;
    description = "sosman64";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # --- HOME-MANAGER
  home-manager.users.sosman64 =
    {
      pkgs,
      lib,
      config,
      ...
    }:

    {
      # --- HOME-MANAGER SETTINGS
      home.enableNixpkgsReleaseCheck = false;

      # --- BASH
      programs.bash.enable = true;
      home.shellAliases.nrb = "sudo nixos-rebuild switch --no-reexec";

      home.stateVersion = "25.11";
    };
}
