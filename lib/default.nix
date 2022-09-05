{ inputs, ... }:

rec {
  systems = [
    "aarch64-darwin"
    "aarch64-linux"
    "i686-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];
  forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
}
