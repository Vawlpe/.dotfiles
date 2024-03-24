{ pkgs, ... }: 
{
  programs.zsh = {
    enable = true;
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
    initExtraFirst = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh
    '';
  };
}
