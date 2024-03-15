{ config, pkgs, ... }:
{
  home.username = "hazel";
  home.homeDirectory = "/home/hazel";
  home.stateVersion = "23.11";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  # Programs
  # ...

  # Packages
  home.packages = with pkgs; [
    vlc
    helvum
    gnome.nautilus
    wofi
    pwvucontrol
    easyeffects
  ];

  # Gtk
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "black" ];
      };
    }; 
  };

  # QT
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
