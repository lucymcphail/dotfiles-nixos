{ pkgs, ...}:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    source-code-pro
    inter
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
