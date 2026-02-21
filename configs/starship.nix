{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

{
  home-manager.users.sosman64 =
    {
      pkgs,
      lib,
      config,
      ...
    }:

    {
      # --- GENERAL
      programs.starship.enable = true;

      # --- FILE
      home.file.".config/starship.toml".text =
        let
          battery-disabled = true;
        in ''
        "$schema" = 'https://starship.rs/config-schema.json'
        [battery]
        disabled = ${if battery-disabled then "true" else "false"}

        [aws]
        symbol = " "

        [buf]
        symbol = " "

        [bun]
        symbol = " "

        [c]
        symbol = " "

        [cpp]
        symbol = " "

        [cmake]
        symbol = " "

        [conda]
        symbol = " "

        [crystal]
        symbol = " "

        [dart]
        symbol = " "

        [deno]
        symbol = " "

        [directory]
        read_only = " 󰌾"

        [docker_context]
        symbol = " "

        [elixir]
        symbol = " "

        [elm]
        symbol = " "

        [fennel]
        symbol = " "

        [fortran]
        symbol = " "

        [fossil_branch]
        symbol = " "

        [gcloud]
        symbol = " "

        [git_branch]
        symbol = " "

        [git_commit]
        tag_symbol = '  '

        [golang]
        symbol = " "

        [gradle]
        symbol = " "

        [guix_shell]
        symbol = " "

        [haskell]
        symbol = " "

        [haxe]
        symbol = " "

        [hg_branch]
        symbol = " "

        [hostname]
        ssh_symbol = " "

        [java]
        symbol = " "

        [julia]
        symbol = " "

        [kotlin]
        symbol = " "

        [lua]
        symbol = " "

        [memory_usage]
        symbol = "󰍛 "

        [meson]
        symbol = "󰔷 "

        [nim]
        symbol = "󰆥 "

        [nix_shell]
        symbol = " "

        [nodejs]
        symbol = " "

        [ocaml]
        symbol = " "

        [os.symbols]
        NixOS = " "

        [package]
        symbol = "󰏗 "

        [perl]
        symbol = " "

        [php]
        symbol = " "

        [pijul_channel]
        symbol = " "

        [pixi]
        symbol = "󰏗 "

        [python]
        symbol = " "

        [rlang]
        symbol = "󰟔 "

        [ruby]
        symbol = " "

        [rust]
        symbol = "󱘗 "

        [scala]
        symbol = " "

        [status]
        symbol = " "

        [swift]
        symbol = " "

        [xmake]
        symbol = " "

        [zig]
        symbol = " "
      '';
    };
}
