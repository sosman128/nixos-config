{
  pkgs,
  lib,
  config,
  inputs,
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
      programs.fastfetch.enable = true;

      home.shellAliases.fastfetch =
        let
          color = "magenta";
          output-color = "magenta";
          logo-color-1 = "magenta";
          logo-color-2 = "white";
        in
        "clear && fastfetch --color ${color} --logo-color-1 ${logo-color-1} --logo-color-2 ${logo-color-2} --color-output ${output-color}";
    };
}
