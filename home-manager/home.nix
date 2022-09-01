# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  # Comment out if you wish to disable unfree packages for your system
  nixpkgs.config.allowUnfree = true;

  # TODO: Set your username
  home = rec {
    username = "lucy";
    homeDirectory = "/home/${username}";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    dmenu
    firefox
    haskellPackages.xmobar
    haskellPackages.hindent
    feh
    kitty
    vim
    git
    stow
    gnome3.gnome-tweaks
    emacs
    wget
  ];

  services.emacs.enable = true;

  home.file = {
    ".emacs.d" = {
      source = ../emacs;
      recursive = true;
    };
    ".config/xmonad/xmonad.hs" = {
      source = ../xmonad/xmonad.hs;
    };
    ".xmobarrc" = {
      source = ../xmonad/xmobar.hs;
    };
    ".config/kitty/kitty.conf" = {
      source = ../kitty/kitty.conf;
    }
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
