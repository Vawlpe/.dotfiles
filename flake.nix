{
  description = "Vawlpe's multi-system/multi-user flake";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
#<MOVE-ME>
    # GitButler
    gitbutler-nixpkgs.url = "github:hallettj/nixpkgs/234bdf4fd6b9e5f58713fdb0a04c217f9ebb0923";
    
    # Niri 
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    
    # Sddm catppuccin theme
    sddm-catppuccin.url = "github:khaneliman/catppuccin-sddm-corners";
    sddm-catppuccin.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    # AGS
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";

    # Pro Audio (musnix)
    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";
#</MOVE-ME>
  };

  outputs = {self, nixpkgs, ... }@inputs: {
    inputs.gitbutler-nixpkgs.config.allowUnfree = true;
    # Hosts
    nixosConfigurations = {
      agate = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/agate/configuration.nix
          inputs.home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.hazel = import ./modules/home-manager/hazel/home.nix;
          }
        ];
      };
    };
  };
}
