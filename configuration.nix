# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ###---Config-Splitting---###
    ./programs.nix
    ./modules/audio.nix
    ./modules/nix.nix
    ./modules/nvidia.nix
    ./modules/network-manager.nix
    ./modules/fonts.nix

    ./home/catppuccin/catppuccin.nix
    ./home/plymouth/plymouth.nix

    ###---Programs---###
    inputs.home-manager.nixosModules.default
    inputs.spicetify-nix.nixosModules.default
    #catppuccin.nixosModules.catppuccin  
  ];


  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.enable = true;
#  boot.loader.grub = {
#    device = "nodev";
#    efiSupport = true;
#    enable = true;
#    useOSProber = true;
#  };
  
  #networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged 
    # programs here, NOT in environment.systemPackages
  ];
  
  ########## Flatpaks
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services = {
    flatpak.enable = true;
  };

  services.flatpak.update.onActivation = true;

  services.flatpak.packages = [
#    { appId = "com.brave.Browser"; origin = "flathub";  }
#    "com.obsproject.Studio"
#    "im.riot.Riot"


  ];

  ##########

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  users.users.costeer = {
    isNormalUser = true;
    description = "costeer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };


  
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "costeer" = import ./home.nix;
    };
  };
  #-E.V.'.s.---------------------Enviroment-Variables--------------------------------------------#

  environment.sessionVariables = {
    #If your cursor becomes invisible
    no_hardware_cursors = "true";
    #Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  #------------------------------------------------------------------#
  
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  system.stateVersion = "24.05"; # Do not CHANGE!!!

}
