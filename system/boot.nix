{ pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "25.11"; 
  #boot.tmp.cleanOnBoot = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}