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
    vlc
    w3m
    wget
    zotero

    (discord.override { nss = nss_latest; })
    spotify
    zoom-us
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services.dropbox.enable = true;

  home.stateVersion = "22.05";
}
