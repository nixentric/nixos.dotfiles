{ config, pkgs, ...}:

{
home.stateVersion = "25.11";

home.username = "nixentric";
home.homeDirectory = "/home/nixentric";

home.packages = with pkgs; [
   git
   btop
   kitty
];

programs.git = {
  enable = true;
  userName = "nixentric";
  userEmail = "dev@nixentric.com";
};

programs.home-manager.enable = true;

programs.sherlock = {
  enable = true;

  # to run sherlock as a daemon
  systemd.enable = true;

  # If wanted, you can use this line for the _latest_ package. / Otherwise, you're relying on nixpkgs to update it frequently enough.
  # For this to work, make sure to add sherlock as a flake input!
  # package = inputs.sherlock.packages.${pkgs.system}.default;

  # config.toml
  settings = {};

  # sherlock_alias.json
  aliases = {
    vesktop = { name = "Discord"; };
  };

  # sherlockignore
  ignore = ''
    Avahi*
  '';

  # fallback.json
  launchers = [
    {
      name = "Calculator";
      type = "calculation";
      args = {
        capabilities = [
          "calc.math"
          "calc.units"
        ];
      };
      priority = 1;
    }
    {
      name = "App Launcher";
      type = "app_launcher";
      args = {};
      priority = 2;
      home = "Home";
    }
  ];

  # main.css
  style = /* css */ ''
    * {
      font-family: sans-serif;
    }
  '';
};

}
