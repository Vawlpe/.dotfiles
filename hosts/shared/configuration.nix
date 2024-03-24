# /hosts/shared/configuration.nix

# These options are meant to be shared across all hosts

{ config, pkgs, inputs, ... }:
{
  # Enable experimenmtal features
  nix.settings.experimental-features = [ 
    "nix-command"
    "flakes"
  ];
  
  # Bootloader
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Default Locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Allow Unfree by default
  nixpkgs.config.allowUnfree = true;

  # Default packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
    btop
    lf
  ];

  # Default programs
  programs.vim.defaultEditor = true;
  programs.tmux.enable       = true;
  programs.git.enable        = true;
  programs.light.enable      = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Default services
  security.rtkit.enable   = true;
  services.openssh.enable = true;
  services.pipewire = {
    enable       = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable  = true;
    alsa.enable  = true;
  };
}
