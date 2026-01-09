{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;

    imports = [
      ./plugins/ui.nix
      ./plugins/lsp.nix
      ./plugins/telescope.nix
    ];
  };
}
