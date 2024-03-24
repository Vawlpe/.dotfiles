{ inputs, config, pkgs, ... }: let
  catppuccin-wallpapers = import ../../../packages/catppuccin-wallpapers.nix { inherit pkgs; };
in {
  imports = [
    ../shared/terminals/default.nix
    ../shared/shells/default.nix
    ../shared/browsers/default.nix
    ../shared/widgets/ags.nix
    ../shared/widgets/wofi.nix
    ../shared/cava.nix
  ];
  
  # Home
  home.username = "hazel";
  home.homeDirectory = "/home/hazel";
  home.stateVersion = "23.11";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };


  # Packages
  home.packages = with pkgs; [
    vlc
    helvum
    pwvucontrol
    easyeffects
    gnome.nautilus
    obsidian
    deluge-gtk
    prismlauncher
    godot_4
    grim
    pipes
    waypaper
    kdePackages.kdenlive
  ] ++ [
    catppuccin-wallpapers
  ];

  # Misc. Dotfiles
  home.file = {
    ".config/waypaper/config.ini".text = ''
      [Settings]
      folder = ${catppuccin-wallpapers}
      subfolders = True
    '';
  };
  
  # Programs
  programs.kitty.settings.shell = "zsh";
  programs.kitty.shellIntegration.enableZshIntegration = true;

  # Gtk
  fonts.fontconfig.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ ];
      };
    }; 
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };
    font = {
      name = "FiraCode Nerd Font Regular";
      package = pkgs.fira-code-nerdfont;
      size = 8; 
    };
  };

  # QT
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
