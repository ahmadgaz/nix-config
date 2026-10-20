{
  description = "Nix config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    disko,
    ...
  }: 
  let
    mkHost = name: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ disko.nixosModules.disko ./hosts/${name} ];
    };
    mkHome = user: system: home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs; };
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home/${user} ];
    };
  in {
    nixosConfigurations = {
      sunny = mkHost "sunny";
      wano = mkHost "wano";
    };
    homeConfigurations = {
      "ahmad@sunny" = mkHome "ahmad" "x86_64-linux";
      "ahmad@wano" = mkHome "ahmad" "x86_64-linux";
    };
  };
}

