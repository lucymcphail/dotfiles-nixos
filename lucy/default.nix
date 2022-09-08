{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./tools

    ./desktop.nix
  ];

  home = rec {
    username = "lucy";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    comma
    firefox
    discord
    kitty
    vim
    stow
    spotify
    emacs
    wget
    w3m
  ];

  services.emacs.enable = true;
  services.dropbox.enable = true;

  home.keyboard = {
    layout = "gb";
    options = [ "ctrl:nocaps" "compose:ralt" ];
  };

  home.file = {
    ".emacs.d" = {
      source = ../etc/emacs;
      recursive = true;
    };
    ".config/kitty/kitty.conf" = {
      source = ../etc/kitty/kitty.conf;
    };
  };

  home.stateVersion = "22.05";
}
