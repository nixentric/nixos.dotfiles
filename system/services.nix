{ pkgs, ... }: {
  services.syncthing = {
    enable = true;
    user = "nixentric";
    dataDir = "/home/nixentric"; 
    configDir = "/home/nixentric/.config/syncthing";
    overrideDevices = true; 
    overrideFolders = true;
  };

  # Opsional: Membuka akses ke Web UI dari perangkat lain
  # Secara default hanya bisa diakses via localhost:8384
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}