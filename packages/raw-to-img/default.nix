{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "raw-to-img";
  version = "0.3.3";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = version;
    sha256 = "sha256-3wGBwTO/ZuEoZ3U3VlEGzdUlIHrT6uLqO/AO5jljxgk=";
  });

  meta = with lib; {
    description = "Converts raw image files produced by cameras into regular image files. Also works recursively on whole file trees instead of just a single folder or image.";
    homepage = "https://github.com/jzbor/raw-to-img";
    license = licenses.mit;
  };
}
