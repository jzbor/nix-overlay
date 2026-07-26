{ buildGoModule, fetchFromGitHub, ... }:

buildGoModule {
  pname = "shelly-exporter";
  version = "unstable-2026-07-10";

  src = fetchFromGitHub {
    owner = "ashlcx";
    repo = "shelly-exporter";
    rev = "4413bc21c4937c0f3a2783e0e7d599042a8abcfe";
    hash = "sha256-w1jh/M0dOGgV5mhAyvfGV8tIeH1MXj5n/0pCSdTsMhg=";
  };
  vendorHash = "sha256-3H48lGQKvie2xZU4BGEJf7PtQlTK5q0uwl5zYbRiquY=";

  meta = {
    description = "Prometheus exporter for Shelly Gen3 smart plugs";
    homepage = "https://github.com/ashlcx/shelly-exporter";
  };
}
