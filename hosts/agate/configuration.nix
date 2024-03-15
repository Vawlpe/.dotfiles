# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports =
    [
      # Hardware Config
      ./hardware-configuration.nix

      # Niri module
      inputs.niri.nixosModules.niri
      
      # Spicetify module
      inputs.spicetify-nix.nixosModule
    ];


  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "agate"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Configure keymap in X11
  # services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hazel = {
    isNormalUser = true;
    description = "Hazel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    gnome.nautilus
    wofi
    dunst
    neofetch
    slurp
    helvum
    cliphist
    wl-clipboard
    easyeffects
    pipewire
    lf
    btop
    libsForQt5.qt5.qtgraphicaleffects
   ] ++ [
     inputs.sddm-catppuccin.packages.${pkgs.hostPlatform.system}.sddm-catppuccin
   ];

  # Misc. Programs
  programs.vim.defaultEditor = true;
  programs.tmux.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;  
  programs.waybar.enable = true;
  programs.light.enable = true;
  
  # WM: Hyprland (wayland)
  programs.hyprland.enable = true;
  
  # WM: Niri (wayland)
  programs.niri.enable = true;
  
  # Spicetify
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  # QT
  qt.enable = true;
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";

  # List services that you want to enable:

  # Services: SSH 
  services.openssh.enable = true;

  # Services: Pipewire (pulse, jack, alsa)
  services.pipewire = {
    enable            = true;
    audio.enable      = true;
    pulse.enable      = true;
    jack.enable       = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
  };
  
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
