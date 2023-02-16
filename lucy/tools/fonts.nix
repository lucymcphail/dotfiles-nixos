{ pkgs, ...}:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    eb-garamond
    source-code-pro
    inter
    iosevka
    iosevka-comfy.comfy-fixed
    julia-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
