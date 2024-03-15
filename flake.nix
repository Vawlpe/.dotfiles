{
  description = "Vawlpe's system flake";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    # TBA
    
    # Niri 
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    
    # Sddm catppuccin theme
    sddm-catppuccin.url = "github:khaneliman/catppuccin-sddm-corners";
    sddm-catppuccin.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
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
