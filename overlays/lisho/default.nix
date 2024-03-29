self: super:

{
  lisho = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "lisho";
      version = "0.1.4";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-3wR/3ggh3TkTcRCPj8dvJsVhrEa6KzzHKvdBhQFBiBQ=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };

      meta = with lib; {
        description = "A simple personal link shortener with no external dependencies.";
        homepage = "https://github.com/jzbor/lisho";
        license = licenses.mit;
        maintainers = [ maintainers.jzbor ];
      };
    }
  ) {};
}

