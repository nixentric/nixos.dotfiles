{
  pkgs,
  character,
  resolution,
}:
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
    cp -r assets/assets-icons "$out/icons"
    cp -r assets/assets-other/other-${resolution}/* "$out/"
    cp backgrounds/background-${character}.jpg "$out/background.jpg"
    cp config/theme-${resolution}.txt "$out/theme.txt"
    sed -i 's/desktop-image:.*/desktop-image: "background.jpg"/' "$out/theme.txt"
  '';
}
