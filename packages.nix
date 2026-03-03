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
    niri
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
    grim
    slurp
    wl-clipboard
    alacritty
    xfce.thunar
    fuzzel
    waybar
    cmatrix
    zellij
    xwayland-satellite
  ];

  # --- FONT PACKAGES
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
  ];
}
