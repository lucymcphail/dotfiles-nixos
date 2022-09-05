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

  home.file = {
    ".config/xmonad/xmonad.hs" = {
      source = ../etc/xmonad/xmonad.hs;
    };
    ".xmobarrc" = {
      source = ../etc/xmonad/xmobar.hs;
    };
  };
}
