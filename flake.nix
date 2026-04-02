{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allow_unfree = true;
      };
    in {
      nixosConfigurations = {
        main-pc = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./nixos/hosts/main-pc/configuration.nix
          ];
        };
      };
    };
}

