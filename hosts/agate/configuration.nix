# /hosts/agate/configuration.nix

# First draft host "Agate"'s main module

{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../shared/configuration.nix

    # Flake stuff, to be moved
    inputs.niri.nixosModules.niri

    # Modules
    ../../modules/nixos/shared/gitbutler.nix
    ../../modules/nixos/shared/spicetify.nix
  ];

  # Networking
  networking.hostName = "agate";
  networking.networkmanager.enable = true;

  # Time 
  time.timeZone = "Europe/Bucharest";

  # Locale
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  # Users 
  users.users.hazel = {
    isNormalUser = true;
    description = "Hazel";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  # Packages
  environment.systemPackages = with pkgs; [
    # kitty
    #dunst
    slurp
    cliphist
    wl-clipboard
    pipewire
    libsForQt5.qt5.qtgraphicaleffects
    cage
    ntfs3g
    swww
    protonmail-desktop
   ] ++ [
   # Pain & Suffering
     inputs.sddm-catppuccin.packages.${pkgs.hostPlatform.system}.sddm-catppuccin
   ];

  # Misc. Programs
  programs.firefox.enable = true;  
  programs.steam.enable   = true;
  
  # WM: Hyprland (wayland)
  programs.hyprland.enable = true;
  
  # WM: Niri (wayland)
  programs.niri.enable = true;

  # programs.mtr.enable = true;

  # Services: xserver (sddm)
  services.xserver = {
    enable = true;
    libinput.enable = true;
    
    # Display Manager
    displayManager = {
      defaultSession = "niri";

      # SDDM
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin";
      };
    };
  };
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
