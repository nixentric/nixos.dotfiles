{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/user.nix
    ./system/storage.nix
    ./system/network.nix
    ./system/gui.nix
    ./system/services.nix
  ];

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    bat
    fish
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
