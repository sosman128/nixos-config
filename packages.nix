{
  lib,
  pkgs,
  ...
}:

{
  # --- SYSTEM PACKAGES
  environment.systemPackages = with pkgs; [
    git
    emacs
    python3
    wget
    mangowc
  ];

  # --- USER PACKAGES
  users.users.sosman64.packages = with pkgs; [
    kdePackages.kate
    kdePackages.qtstyleplugin-kvantum
    chromium
    vesktop
    krita
    nixfmt
    nixd
    bash
    btop
    eza
    fastfetch
    starship
    zoxide
    srb2
    swaybg
    grim
    slurp
    wl-clipboard
    alacritty
  ];

  # --- FONT PACKAGES
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
  ];
}
