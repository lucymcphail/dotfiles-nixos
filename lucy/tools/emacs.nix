{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
      use-package

      # appearance
      modus-themes
      minions
      fontaine

      # completion
      vertico
      orderless
      marginalia
      consult
      consult-dir
      corfu
      corfu-doc
      cape
      pcmpl-args

      # writing
      org
      auctex
      pdf-tools
      olivetti
      logos
      laas

      # misc
      adaptive-wrap
      direnv
      editorconfig
      elisp-slime-nav
      exec-path-from-shell
      magit
      projectile
      rainbow-mode
      restclient
      transpose-frame
      w3m
      whitespace-cleanup-mode

      # languages
      agda2-mode
      haskell-mode
      hindent
      nix-mode
      python
      slime
      web-mode
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
