 { config, pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.users.costeer = {
      isNormalUser = true;
      description = "costeer";
      extraGroups = [ "networkmanager" "wheel" ]; 
    };
  };
}
