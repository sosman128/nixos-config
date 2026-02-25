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
    ./configs/bash.nix
    ./configs/zoxide.nix
    ./configs/mangowc.nix
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
      home.enableNixpkgsReleaseCheck = false;
      home.stateVersion = "25.11";
    };
}
