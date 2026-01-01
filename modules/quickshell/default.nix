{ pkgs, inputs, ... }: {
  # Instalasi package

  home.packages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    qt6.qt5compat
  ];

  # Mengelola file config secara deklaratif
  # xdg.configFile."quickshell/shell.qml".text = ''
  # '';

  xdg.configFile."quickshell".source = ../quickshell;
}
