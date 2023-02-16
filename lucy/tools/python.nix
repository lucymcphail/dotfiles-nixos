{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      ipython

      jupyter
      jupyterlab
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

  xdg.desktopEntries = {
    jupyterlabDesktopItem = {
      name = "Jupyter Lab";
      exec = "jupyter-lab %f";
      comment = "Run Jupyter Lab";
      terminal = true;
      icon = "notebook";
      startupNotify = true;
      mimeType = [ "application/x-ipynb+json" ];
    };
  };
}
