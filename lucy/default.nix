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
    kitty
    stow
    vim
    w3m
    wget

    (discord.override { nss = nss_latest; })
    spotify
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
