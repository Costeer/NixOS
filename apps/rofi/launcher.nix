{ config, lib, pkgs, ... }:
{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/rofi/launcher.sh".text = ''

  #!/usr/bin/env bash

  dir="$HOME/.config/rofi/launchers/type-2"
  theme='style-adweita'

  ## Run
  rofi \
      -show drun \
      -theme $HOME/.config/rofi/launchers/type-2/style-adweita.rasi
  
  ''; 
}
