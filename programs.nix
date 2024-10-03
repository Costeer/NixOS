{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  #----------------------Programs------------------------------------#
    
    #---Terminal-Stuff---#
    vim 
    eza
    zoxide
    wget
    git
    asciiquarium-transparent
    protontricks
    cmatrix
    unzip
    btop
    playerctl
    zenith-nvidia
    nodejs_22
    #-Fetch-Scripts
    microfetch
    nitch
    maxfetch
    fastfetch
    nerdfetch
    afetch
    #---Customization---#
    bibata-cursors
    bibata-cursors-translucent
    hyprpaper
    nwg-look
    adw-gtk3
    gnome-extension-manager
    #(pkgs.waybar.overrideAttrs (oldAttrs: {
    #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    # })
    #)
    dunst
    #hyprnome
    #where-is-my-sddm-theme
    rofi-wayland
    #onagre
    #lemurs
    wlogout
    papirus-icon-theme
    papirus-folders
    spicetify-cli
    egl-wayland
    
    #---Applications---#
    flatpak
    gamescope
    hyprshot
    gnome-disk-utility
    gnome-software
    gnome-text-editor
    gedit
    gnome-calculator
    nautilus
    hyprpicker
    vesktop
    #kdePackages.kcolorpicker
    mangohud
    #gamescope
    gnome-tweaks
    localsend
    jetbrains-mono
    inputs.zen-browser.packages."${system}".specific
    kitty
    alacritty
    obsidian
    krita
    lutris-unwrapped
    fragments
    blender
    #virtualboxWithExtpack
    spotify
  ];

 #-P.T.N.E.---------------------Programs-That-Need-Enabeling------------------------------------#

  # Cosmic
  #services.desktopManager.cosmic.enable = true;
  #services.displayManager.cosmic-greeter.enable = true;

  # Zsh  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  ###---Steam-n'-Stuff---###
  
  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  ###---Hyperland---### 
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.spicetify =
     let
       spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
     in
     {
       enable = true;
       enabledExtensions = with spicePkgs.extensions; [
         adblock
         hidePodcasts
         shuffle # shuffle+ (special characters are sanitized out of extension names)
       ];
       theme = spicePkgs.themes.default;
     };

  #hardware.system76.enableAll = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos/";
  };

  #----------------------------------------------------------------------------------------------#  
}
