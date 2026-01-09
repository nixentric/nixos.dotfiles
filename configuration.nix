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

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
