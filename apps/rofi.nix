{ config, lib, pkgs, ... }:

{
  imports = [
    ./rofi/launcher.nix
    #./rofi/powermenu.nix
    ./rofi/clock-launcher.nix
  ];
  
  home.file.".config/rofi/launcher.sh".text = ./rofi/powermenu.nix;
  
}
