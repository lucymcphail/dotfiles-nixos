{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      ipython

      jupyter
      matplotlib
      numpy
      pandas
      scipy
      sympy

      pwntools
      pycryptodomex
    ]))
  ];
}
