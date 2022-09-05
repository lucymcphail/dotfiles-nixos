{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # Feel free to split up your configuration and import pieces of it here.
  ];

  home = rec {
    username = "lucy";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Lucy McPhail";
    userEmail = "lucy.mcphail.p@gmail.com";
  };

  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    dmenu
    firefox
    discord
    haskellPackages.xmobar
    feh
    kitty
    vim
    git
    stow
    emacs
    wget
  ];

  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 16;
  };

  services.emacs.enable = true;

  home.file = {
    ".emacs.d" = {
      source = ../etc/emacs;
      recursive = true;
    };
    ".config/xmonad/xmonad.hs" = {
      source = ../etc/xmonad/xmonad.hs;
    };
    ".xmobarrc" = {
      source = ../etc/xmonad/xmobar.hs;
    };
    ".config/kitty/kitty.conf" = {
      source = ../etc/kitty/kitty.conf;
    };
  };

  home.stateVersion = "22.05";
}
