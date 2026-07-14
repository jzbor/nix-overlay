{ pkgs, fetchFromGitHub, ... }:

let
  pnpm = pkgs.pnpm_11;
in pkgs.stdenv.mkDerivation rec {
  pname = "nixpkgs-tracker";
  version = "unstable-2026-06-18";

  src = fetchFromGitHub {
    owner = "ocfox";
    repo = pname;
    rev = "7718d5007c405476036674c56b4c7f1cbb02d79d";
    sha256 = "sha256-7MLY1fvYe8YPtr7EZ7qeBSXfzEua5c/EQ07OsI+XHTE=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    fetcherVersion = 4;
    hash = "sha256-74V33FGmBHQuA1uE/BqyhjcPe9inwXZYRx7Ww8tYnKk=";
  };

  nativeBuildInputs = with pkgs; [
    nodejs
    pnpm.configHook
  ];

  buildPhase = "pnpm build";

  installPhase = ''
    runHook preInstall

    mkdir $out
    mv dist/* $out

    runHook postInstall
  '';
}
