{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./tools
  ];

  home = rec {
    username = "lucy";
    homeDirectory = "/home/${username}";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    comma
    distrobox

    man-pages
    man-pages-posix

    ed
    ffmpeg
    firefox-wayland
    kdeconnect
    kitty
    obs-studio
    pandoc
    plasma-browser-integration
    ripgrep
    stow
    vlc
    w3m
    wget
    zotero

    (discord.override { nss = nss_latest; })
    obsidian
    spotify
    zoom-us
  ];

  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services.dropbox.enable = true;

  home.stateVersion = "22.05";
}
