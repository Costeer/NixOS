#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░        ░░░      ░░░░      ░░░        ░░        ░░        ░░        ░░░      ░░░  ░░░░  ░
#▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒
#▓      ▓▓▓▓  ▓▓▓▓  ▓▓▓      ▓▓▓▓▓▓  ▓▓▓▓▓      ▓▓▓▓      ▓▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓▓▓▓▓        ▓
#█  ████████        ████████  █████  █████  ████████  ███████████  █████  ████  ██  ████  █
#█  ████████  ████  ███      ██████  █████  ████████        █████  ██████      ███  ████  █
#██████████████████████████████████████████████████████████████████████████████████████████                                                                                          
{ config, lib, pkgs, ... }:
{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/fastfetch/config.jsonc".text = ''
 
 {
  "logo": {
    "type": "kitty-direct",
    "source": "/etc/nixos/apps/resources/nixoslogolila.png",
    "height": -800,
    "padding": {
      "right": 0,
      "top": 0
    }
  },
  "general": {
    "multithreading": true

  },
  "modules": [
    {
      "key": "     OS        ",
      "keyColor": "green",
      "type": "os"
    },
    {
      "key": "    󰅐 Uptime    ",
      "keyColor": "green",
      "type": "uptime"
    },
    {
      "key": "     Packages  ",
      "keyColor": "cyan",
      "type": "packages"
    },
    {
      "key": "     WM        ",
      "keyColor": "blue",
      "type": "wm"
    },
    {
      "key": "    󰻠 CPU       ",
      "keyColor": "green",
      "type": "cpu"
    },
    {
      "key": "    󰍛 GPU       ",
      "keyColor": "cyan",
      "type": "gpu"
    },
    {
      "key": "    󰑭 Memory    ",
      "keyColor": "blue",
      "type": "memory"
    },
    {
      "keyColor": "green",
      "type": "title",
      "key": "     HOST      ",
    },
    "break",
    {
      "type": "colors",
      "paddingLeft": 34,
      "symbol": "circle",
      "block": {
        "width": 10
      }
    }
  ]
}
 
  ''; 
}
