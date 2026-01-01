{ pkgs, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfat
  ];
}