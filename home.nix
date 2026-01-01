{ pkgs, inputs, ... }: {

  home = {
    username = "nixentric";
    homeDirectory = "/home/nixentric";
    stateVersion = "25.11"; 
  }; 

  imports = [
    ./modules/hypr/default.nix
    ./modules/quickshell/default.nix
    ./modules/git/default.nix
    ./modules/kde.nix
    ./modules/btop.nix
  ];

  home.packages = with pkgs; [
    kitty
    wofi
    brightnessctl
    playerctl
    libnotify
    keepassxc
    libsecret
  ];

  programs.home-manager.enable = true;
}
