{ inputs, pkgs, ... }:

let
  emacs-overlay = inputs.emacs-overlay.packages.${pkgs.system};
in
{
  programs.emacs = {
    enable = true;
    package = emacs-overlay.emacsPgtk;

    extraPackages = epkgs: with epkgs; [
      pdf-tools
      vterm
    ];
  };

  services.emacs.enable = true;

  home.packages = [ pkgs.ispell ];

  home.file = {
    ".emacs.d" = {
      source = ../../etc/emacs;
      recursive = true;
    };
  };
}
