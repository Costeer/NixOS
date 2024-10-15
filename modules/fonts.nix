{ config, pkgs, inputs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    cantarell-fonts
    jetbrains-mono
    ###---NerdFonts---###
    (nerdfonts.override { fonts = [ 
    "FiraCode" 
    "DroidSansMono"
    "JetBrainsMono" 
    ]; })
  ];
}
