{ config, lib, pkgs, ... }:

{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/rofi/clock-launcher.sh".text = ''

dir="/clocks/type-2"
theme='clock1'

date +"%H:%M %a %d.%m." | rofi -dmenu -p -theme /clocks/type-2/clock1.rasi

  ''; 
}
