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
  ];

  # --- USER PACKAGES
  users.users.sosman64.packages = with pkgs; [
    kdePackages.kate
    chromium
    vesktop
    krita
    nixfmt
    srb2
  ];

  # --- FONT PACKAGES
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
  ];
}
