{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  # --- NIX SETTINGS
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  # --- BOOTLOADER
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- NETWORKING
  networking.networkmanager.enable = true;
  networking.hostName = "CentralIntelligenceAgency";

  # --- LOCALE
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.UTF-8";
    LC_IDENTIFICATION = "ar_EG.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "ar_EG.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "ar_EG.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # --- TIME
  time.timeZone = "Africa/Cairo";

  # --- DESKTOP
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;

  # --- KEYBOARD LAYOUT
  services.xserver.xkb = {
    layout = "us";
  };

  # --- PRINTER SUPPORT
  services.printing.enable = true;

  # --- AUDIO
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- ENVIRONMENT VARIABLES
  environment.variables = {
    EDITOR = "nano";
  };

  # --- BLUETOOTH
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
