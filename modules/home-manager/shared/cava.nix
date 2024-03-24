{ pkgs, ... }: {
  programs.cava = {
    enable = true;
    settings = {
      color = {
        background = "'#1E1E2E'";
        foreground = "'#CBA6F7'";
      };
    };
  };
}
