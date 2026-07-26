{ pkgs, lib, craneLib, fetchFromCodeberg, ...  }:

craneLib.buildPackage rec {
  pname = "cliflux";
  version = "1.10.0";

  src = craneLib.cleanCargoSource (fetchFromCodeberg {
    owner = "spencerwi";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-fzuqgzBVnVIOcRplDKLBskhX9PlMA9LM0f3MnLqzyhk=";
  });

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    openssl
  ];

  meta = with lib; {
    description = "A terminal client for Miniflux RSS reader";
    homepage = "https://github.com/spencerwi/cliflux";
    license = licenses.mit;
  };
}
