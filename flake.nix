{
  description = "Vawlpe's system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home manager TBA

    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = {nixpkgs, ...}@inputs: {
    nixosConfigurations = {
      agate = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/agate/configuration.nix
        ];
      };
    };
  };
}
