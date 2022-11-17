{ pkgs, ...}:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    source-code-pro
    inter
    iosevka
    iosevka-comfy.comfy-fixed
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
