{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./configs/cli/starship.nix
    ./configs/cli/fastfetch.nix
    ./configs/tui/btop.nix
    ./configs/cli/eza.nix
    ./configs/gui/srb2.nix
    ./configs/cli/bash.nix
    ./configs/cli/zoxide.nix
    ./configs/gui/niri.nix
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
