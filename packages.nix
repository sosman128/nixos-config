{
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
    dunst
  ];

  # --- USER PACKAGES
  users.users.sosman64.packages = with pkgs; [
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
    wl-clipboard
    alacritty
    fuzzel
    waybar
    cmatrix
    zellij
    xwayland-satellite
    swaybg
    swww
    bluetuith
    eww
    nemo
    tokei
    bc
    libnotify
    vimix-cursors
    godot
    obs-studio
    bat
    unzip
    zip
    shattered-pixel-dungeon
  ];

  # --- FONT PACKAGES
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
  ];
}
