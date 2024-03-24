{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles."Profile0" = {
      id = 0;
      name = "default";
      isDefault = true;
      path = "hty40gla.default";
      userChrome = ''
        #TabsToolbar { visibility: collapse !important }
      '';
      search = {
        default = "DuckDuckGo";
        engines = {
          "DuckDuckGo".metaData.alias = "@ddg";
          "Google".metaData.alias     = "@ggl";
          "Youtube".metaData.alias    = "@yt";
          "Reddit".metaData.alias     = "@rdt";
          "Nix Packages" = {
            definedAliases = [ "@nix" ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            urls = [{
              template = "https://search.nixos.org/packages";
              params   = [
                { name = "type" ; value = "packages"     ; }
                { name = "query"; value = "{searchTerms}"; }
              ]; 
            }];
          };
        };
      };
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
