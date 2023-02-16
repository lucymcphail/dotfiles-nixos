{
  description = "Lucy's Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      lib = import ./lib { inherit inputs; };
    in
      rec {
        legacyPackages = lib.forAllSystems (system:
          import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          }
        );

        nixosConfigurations = {
          asuka = nixpkgs.lib.nixosSystem {
            pkgs = legacyPackages.x86_64-linux;
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/asuka ];
          };
        };

        homeConfigurations = {
          "lucy@asuka" =
            home-manager.lib.homeManagerConfiguration {
              pkgs = legacyPackages.x86_64-linux;
              extraSpecialArgs = { inherit inputs; };
              modules = [ ./lucy ];
            };
        };
      };
}
