{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    mixxx
    reaper
    ardour
    tenacity
    qpwgraph

    # Install plugins
    #surge-XT
    cardinal
    distrho
    calf
    eq10q
    lsp-plugins
    x42-plugins
    x42-gmsynth
    dragonfly-reverb
    guitarix
    FIL-plugins
    geonkick
    ninjas2

    # Install Yabridge for MS-Windows VST plugins
    yabridge
    yabridgectl
    wineWowPackages.stable
  ];

  # Configure Yabridge
  home.file = {
    ".config/yabridgectl/config.toml".text = ''
      plugin_dirs = ['/home/hazel/.win-vst']
      vst2_location = 'centralized'
      no_verify = false
      blacklist = []
    '';
  };

  # Configure plugins
  home.file.".lv2/calf".source = "${pkgs.calf}/lib/lv2";
  
  home.file.".clap/cardinal".source = "${pkgs.cardinal}/lib/clap";
  home.file.".vst/cardinal" .source = "${pkgs.cardinal}/lib/vst";
  home.file.".lv2/cardinal.lv2" .source = "${pkgs.cardinal}/lib/lv2";
  home.file.".vst3/cardinal".source = "${pkgs.cardinal}/lib/vst3"; 

  home.file.".vst/distrho" .source = "${pkgs.distrho}/lib/vst";
  home.file.".lv2/distrho.lv2" .source = "${pkgs.distrho}/lib/lv2";
  home.file.".vst3/distrho".source = "${pkgs.distrho}/lib/vst3";

  home.file.".lv2/eq10q.lv2".source = "${pkgs.eq10q}/lib/lv2";

  home.file.".clap/lsp-plugins"   .source = "${pkgs.lsp-plugins}/lib/clap";
  home.file.".vst/lsp-plugins"    .source = "${pkgs.lsp-plugins}/lib/vst";
  home.file.".lv2/lsp-plugins.lv2".source = "${pkgs.lsp-plugins}/lib/lv2";
  home.file.".vst3/lsp-plugins"   .source = "${pkgs.lsp-plugins}/lib/vst3";
  home.file.".ladspa/lsp-plugins" .source = "${pkgs.lsp-plugins}/lib/ladspa";

  home.file.".lv2/x42-plugins.lv2".source = "${pkgs.x42-plugins}/lib/lv2";
  home.file.".lv2/x42-gmsynth.lv2".source = "${pkgs.x42-gmsynth}/lib/lv2";

  home.file.".vst/dragonfly-reverb"    .source = "${pkgs.dragonfly-reverb}/lib/vst";
  home.file.".lv2/dragonfly-reverb.lv2".source = "${pkgs.dragonfly-reverb}/lib/lv2";

  home.file.".lv2/guitarix.lv2".source = "${pkgs.guitarix}/lib/lv2";

  home.file.".ladspa/fil-plugins".source = "${pkgs.FIL-plugins}/lib/ladspa";

  home.file.".lv2/geonkick.lv2".source = "${pkgs.geonkick}/lib/lv2";

  home.file.".vst/ninjas2"    .source = "${pkgs.ninjas2}/lib/vst";
  home.file.".lv2/ninjas2.lv2".source = "${pkgs.ninjas2}/lib/lv2";
}
