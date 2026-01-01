{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    dolphin
    ark
    kio-extras
    kdegraphics-thumbnailers
    ffmpegthumbs
    kimageformats
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };
}