# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
 
      ###---Config-Splitting---###
      ./programs.nix
      ./modules/nix.nix
      ./modules/audio.nix
      ./modules/users.nix
      ./modules/nvidia.nix
      ./modules/network-manager.nix
  
      ./home/catppuccin/catppuccin.nix
      #./home/plymouth/plymouth.nix

      ###---Programs---###
      inputs.home-manager.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
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
  #security.pam.services.hyprlock = true;
  
  users = {
    defaultUserShell = pkgs.zsh;
    users.users.costeer = {
      isNormalUser = true;
      description = "costeer";
      extraGroups = [ "networkmanager" "wheel" ]; 
    };
  };


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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
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
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

