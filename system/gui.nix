{ pkgs, inputs, ... }:

{
  services = {
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;          
        naturalScrolling = true; 
        middleEmulation = true;  
      };
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    dbus = {
      enable = true;
    };
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
