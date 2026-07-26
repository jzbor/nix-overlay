{ pkgs, lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "rstrict";
  version = "0.1.14";

  src = fetchFromGitHub {
    owner = "creslinux";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-7v3XrpsQe/Q5u/JGt5ZSeyxB2vvoHRujqn/lu/1vAzM=";
  };

  # nativeBuildInputs = with pkgs; [
  #   pkg-config
  # ];

  # buildInputs = with pkgs; [
  #   openssl
  # ];

  meta = with lib; {
    description = "A lightweight, free and open source, secure sandbox for running Linux processes using the Linux kernel's Landlock LSM , implemented in Rust.";
    homepage = "https://rstrict.cloud/";
    license = licenses.mit;
  };
}
