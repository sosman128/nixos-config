{
  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      determinate,
      ...
    }@inputs:
    {
      nixosConfigurations.CentralIntelligenceAgency = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./main.nix
          inputs.home-manager.nixosModules.default
          determinate.nixosModules.default
        ];
      };
    };
}
