{ config, pkgs, inputs, ... }: {

  environment.systemPackages = [
    inputs.gitbutler-nixpkgs.legacyPackages.${pkgs.hostPlatform.system}.gitbutler
  ];
}
