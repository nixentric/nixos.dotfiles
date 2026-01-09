{pkgs, ...}: {
  time.timeZone = "Asia/Jakarta";
  programs.fish.enable = true;
  users.users.nixentric = {
    isNormalUser = true;
    description = "nixentric";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
}
