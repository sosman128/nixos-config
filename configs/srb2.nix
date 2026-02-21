{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home-manager.users.sosman64 = {
    # --- GENERAL
    home.file.".srb2/addons" = {
      source = config.lib.file.mkOutOfStoreSymlink "../../etc/nixos/resources/srb2/addons";
    };
  };
}
