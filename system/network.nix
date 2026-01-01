{ pkgs, ... }:

{
  
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Nix Settings & Hyprland Binary Cache (Internet/Network related)
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.openssh.enable = true;

   # Enable nix-ld to run unpatched binaries (required for VS Code Remote SSH)
   programs.nix-ld = {
     enable = true;
     libraries = with pkgs; [
       stdenv.cc.cc # Standard C++ library
       zlib         # Compression library
       fuse3        # Filesystem in Userspace
       curl         # Networking
       expat        # XML parser
     ];
   };

}