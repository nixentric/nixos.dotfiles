{
  pkgs,
  character,
  resolution,
}: let
  themeFiles = [
    {
      src = "assets/assets-icons";
      dest = "icons";
    }
    {
      src = "assets/assets-other/other-${resolution}/*";
      dest = ".";
    }
    {
      src = "backgrounds/background-${character}.jpg";
      dest = "background.jpg";
    }
    {
      src = "config/theme-${resolution}.txt";
      dest = "theme.txt";
    }
  ];
in
  pkgs.stdenv.mkDerivation {
    pname = "wuthering-grub2-theme";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Wuthering-grub2-themes";
      rev = "main";
      sha256 = "sha256-q9TLZTZI/giwKu8sCTluxvkBG5tyan7nFOqn4iGLnkA=";
    };
    installPhase = ''
      mkdir -p "$out"
      ${builtins.concatStringsSep "\n" (map (f: ''
          cp -r ${f.src} "$out/${f.dest}"
        '')
        themeFiles)}

      sed -i 's/desktop-image:.*/desktop-image: "background.jpg"/' "$out/theme.txt"
    '';
  }
