{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./system.nix
    ./home.nix
  ];

  system.stateVersion = "25.11";
}
