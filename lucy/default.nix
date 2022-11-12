{ inputs, lib, config, pkgs, ... }:

{
  imports = [
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

    ffmpeg
    firefox-wayland
    kdeconnect
    kitty
    obs-studio
    plasma-browser-integration
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

  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services.dropbox.enable = true;

  home.stateVersion = "22.05";
}
