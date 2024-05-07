{ config, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [
    inputs.spicetify-nix.nixosModule
  ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spicePkgs.extensions; [
      songStats
      showQueueDuration
      adblock
      volumePercentage
    ];
  };
}
