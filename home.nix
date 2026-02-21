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

      # --- FASTFETCH
      programs.fastfetch.enable = true;
      home.shellAliases.fastfetch = "clear && fastfetch --color magenta --logo-color-1 magenta --logo-color-2 black --color-output white";
      home.shellAliases.ff = "fastfetch";

      # --- EZA
      programs.eza = {
        enable = true;
        enableBashIntegration = true;
        colors = "auto";
        icons = "auto";
      };
      home.shellAliases.ls = "eza";
      home.shellAliases.tree = "eza --tree";

      # --- BTOP
      programs.btop = {
        enable = true;
        settings.color_theme = "horizon";
      };

      # --- SRB2
      home.file.".srb2/addons" = {
        source = config.lib.file.mkOutOfStoreSymlink "../../etc/nixos/resources/srb2/addons";
      };

      home.stateVersion = "25.11";
    };
}
