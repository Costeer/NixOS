#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░  ░░░░  ░░░      ░░░  ░░░░  ░░        ░░  ░░░░  ░░░      ░░░   ░░░  ░░░      ░░░░      ░░░        ░░       ░░
#▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒   ▒▒   ▒▒  ▒▒▒▒▒▒▒▒   ▒▒   ▒▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒
#▓        ▓▓  ▓▓▓▓  ▓▓        ▓▓      ▓▓▓▓        ▓▓  ▓▓▓▓  ▓▓  ▓  ▓  ▓▓  ▓▓▓▓  ▓▓  ▓▓▓   ▓▓      ▓▓▓▓       ▓▓
#█  ████  ██  ████  ██  █  █  ██  ████████  █  █  ██        ██  ██    ██        ██  ████  ██  ████████  ███  ██
#█  ████  ███      ███  ████  ██        ██  ████  ██  ████  ██  ███   ██  ████  ███      ███        ██  ████  █
#██████████████████████████████████████████████████████████████████████████████████████████████████████████████

{ config, pkgs, ... }:


{
  home.username = "costeer";
  home.homeDirectory = "/home/costeer";

  home.stateVersion = "24.05";
  
  home.packages = [
  
  ];

  ####----Splitting-Confs----####
  imports = [
    ./apps/zsh.nix
    #./apps/fastfetch.nix
    ./home/kitty/kitty.nix
    #./apps/rofi.nix
  ####-----------------------####
  

  ];
  
  programs.git = {
    enable = true;
    userName = "Costeer";
    userEmail = "costeer@protonmail.com";
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.btop = {
    #enable = true;
    catppuccin.enable = true;
  };

  
  catppuccin.flavor = "mocha";
  
  catppuccin.enable = true;

  home.sessionVariables = {
  
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

