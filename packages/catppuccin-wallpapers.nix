{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "catppuccin-wallpapers";
  src = pkgs.fetchFromGitHub {
    owner = "zhichaoh";
    repo = "catppuccin-wallpapers";
    rev = "1023077979591cdeca76aae94e0359da1707a60e";
    sha256 = "0rd6hfd88bsprjg68saxxlgf2c2lv1ldyr6a8i7m4lgg6nahbrw7";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
