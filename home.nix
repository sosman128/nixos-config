{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./configs/tui/btop.nix
    ./configs/gui/srb2.nix
    ./configs/gui/niri.nix
    ./configs/gui/alacritty.nix
    ./configs/cli/bash.nix
    ./configs/cli/eza.nix
    ./configs/cli/fastfetch.nix
    ./configs/cli/zoxide.nix
    ./configs/cli/starship.nix
    ./configs/env/gtk.nix
    ./configs/env/qt.nix
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
