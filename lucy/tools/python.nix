{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      ipython

      numpy
      matplotlib
      pandas

      pwntools
      pycryptodomex
    ]))
  ];
}
