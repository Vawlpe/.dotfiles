{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font = {
      name = "FiraCode Nerd Font Regular";
      package = pkgs.fira-code-nerdfont;
      size = 8;
    }; 
    settings = {
      disable_ligatures = "never";
      window_margin_width = 8;
    };
  };
}
