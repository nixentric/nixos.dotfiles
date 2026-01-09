{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system/boot.nix
      ./system/user.nix
      ./system/storage.nix
      ./system/network.nix
      ./system/gui.nix
      ./system/services.nix
    ];
  
  programs.firefox.enable  = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    bat
  ];

  # # services.dbus.enable = true;
  #  environment.sessionVariables = {
  #   # Driver & Wayland spesifik untuk NVIDIA
  #   LIBVA_DRIVER_NAME = "nvidia";
  #   XDG_SESSION_TYPE = "wayland";
  #   GBM_BACKEND = "nvidia-drm";
  #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   WLR_DRM_NO_ATOMIC = "1";
  #   __GL_GSYNC_ALLOWED = "0";
  #   __GL_VRR_ALLOWED = "0";

  #   # GTK
  #   GDK_DPI_SCALE = "1";

  #   # Konfigurasi Qt untuk mengatasi glitch scaling
  #   QT_QPA_PLATFORM = "wayland;xcb";
  #   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #   QT_WAYLAND_FORCE_DPI = "physical";
  #   QT_SCALE_FACTOR_ROUNDING_POLICY = "PassThrough";
  #   QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    
  #   # Fix Rendering
  #   NGS_DISABLE_SHADERS_CACHE = "1";
  #   QT_SCALE_FACTOR= "1";

  #   MY_PROJECT_KEY = "rahasia-12345";
  # };

 programs.zsh.enable = true;
 programs.bash.enable = true;

   nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

