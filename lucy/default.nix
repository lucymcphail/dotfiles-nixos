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

    coreutils
    man-pages
    man-pages-posix

    ed
    ffmpeg
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

    spotify
    zoom-us
  ];

  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services.dropbox.enable = true;

  manual = {
    json.enable = true;
    html.enable = true;
    manpages.enable = true;
  };

  home.stateVersion = "22.05";

  home.file.girl.text = "nyaaa~\n";
}
