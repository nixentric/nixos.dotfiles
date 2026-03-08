{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
    };

    sherlock = {
       url = "github:Skxxtz/sherlock";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = { inherit inputs; };
       modules = [
         ./configuration.nix

         home-manager.nixosModules.home-manager {
             home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.nixentric = import ./home.nix;
             };
         }
       ];
    };

  };
}
