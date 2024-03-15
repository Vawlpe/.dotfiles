{
  description = "Vawlpe's system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: {
    nixosConfigurations = {
      agate = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/agate/configuration.nix
        ];
      };
    };
  };
}
