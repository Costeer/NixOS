{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ####
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ####
  };

  ###---OUT---####
  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        
        inputs.home-manager.nixosModules.default
        
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}

