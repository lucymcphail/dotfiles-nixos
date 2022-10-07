{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./tools
  ];

  home = rec {
    username = "lucy";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    comma
    distrobox

    firefox-wayland
    kitty
    obs-studio
    ripgrep
    stow
    vim
    vlc
    w3m
    wget
    zotero


    (discord.override { nss = nss_latest; })
    spotify
    zoom-us
  ];

  services.dropbox.enable = true;

  home.file = {
    ".config/kitty/kitty.conf" = {
      source = ../etc/kitty/kitty.conf;
    };
  };

  home.stateVersion = "22.05";
}
