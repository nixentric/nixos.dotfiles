{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["nvidia"];

  boot.kernelParams = [ 
    "nvidia-drm.modeset=1" 
    "nvidia-drm.fbdev=1"   
  ];

  hardware = {
    graphics.enable = true;

    opengl.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
         sync.enable = true;

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
