{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
    };

    umu= {
      url = "git+https://github.com/Open-Wine-Components/umu-launcher/?dir=packaging\/nix&submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    catppuccin.url = "github:catppuccin/nix";

    
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 

  ###---OUT---####
  outputs = { self, nixpkgs, nix-flatpak, catppuccin, home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      
      modules = [
        ./configuration.nix
        
        catppuccin.nixosModules.catppuccin
        # if you use home-manager
        home-manager.nixosModules.home-manager


        {
          home-manager.users.costeer = {
            imports = [
              ./home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
        
        #inputs.hyprpanel.overlay.hyperpanel

        inputs.home-manager.nixosModules.default
        
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}

