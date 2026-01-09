{pkgs, ...}: {
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
      useOSProber = false;
      theme = import ./themes/wuthering-grub.nix {
        inherit pkgs;
        character = "changli";
        resolution = "1080p";
      };
      gfxmodeEfi = "1920x1080";
    };

    efi.canTouchEfiVariables = false;
  };

  system.stateVersion = "25.11";
  #boot.tmp.cleanOnBoot = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
