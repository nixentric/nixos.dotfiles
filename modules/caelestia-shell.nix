{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
