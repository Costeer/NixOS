{ config, pkgs, inputs, ... }:

{
  boot.loader.grub.catppuccin.enable = true;
  boot.plymouth.catppuccin.enable = true;
  #boot.plymouth.catppuccin.flavor = mocha;
}
