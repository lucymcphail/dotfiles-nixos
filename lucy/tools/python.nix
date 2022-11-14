{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      ipython

      jupyter
      matplotlib
      numpy
      pandas
      pillow
      scipy
      sympy

      pwntools
      pycryptodomex
    ]))
  ];
}
