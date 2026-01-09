{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "nixentric";
    homeDirectory = "/home/nixentric";
    stateVersion = "25.11";
  };

  imports = [
    ./modules/hypr/default.nix
    ./modules/git/default.nix
    ./modules/kde.nix
    ./modules/btop.nix
    ./modules/nixvim/default.nix
    ./modules/fish/default.nix
  ];

  home.packages = with pkgs; [
    kitty
    wofi
    brightnessctl
    playerctl
    libnotify
    keepassxc
    libsecret
    fastfetch
  ];

  programs.home-manager.enable = true;
}
