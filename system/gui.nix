{ pkgs, ... }:

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

  programs.hyprland.enable = true;
}