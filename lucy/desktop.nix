{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dmenu
    feh
  ];

  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 16;
  };

  services.trayer = {
    enable = true;

    settings = {
      edge = "top";
      align = "right";
      width = 10;
      height = 25;

      transparent = "true";
      alpha = 0;
      tint = "0x00000000";
    };
  };

  programs.xmobar = {
    enable = true;
    extraConfig = (builtins.readFile ../etc/xmonad/xmobar.hs);
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  home.file = {
    ".config/xmonad/xmonad.hs" = {
      source = ../etc/xmonad/xmonad.hs;
    };
  };
}
