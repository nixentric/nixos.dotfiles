{ pkgs, ... }:

let
  gitWithSecret = pkgs.git.override { withLibsecret = true; };
in
{
  programs.git = {
    enable = true;
    package = gitWithSecret;
    settings = {
      user = {
        name  = "nixentric";
        email = "dev@nixentric.com";
      };
      init.defaultBranch = "master";
      credential.helper = "${gitWithSecret}/bin/git-credential-libsecret";
    };
  };
}
