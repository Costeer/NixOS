{
  networking.networkmanager.enable = true;
  # systemd.services.NetworkManager-wait-online.enable = false;
  networking.hostName = "nixos"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
