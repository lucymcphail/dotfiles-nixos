{ pkgs, ... }:

let
  gnome-extensions = with pkgs.gnomeExtensions; [
    blur-my-shell
    espresso
    gnome-40-ui-improvements
    impatience
    noannoyance-2
    sound-output-device-chooser
    spotify-tray
  ];
in
{
  home.packages = [ pkgs.gnome.gnome-tweaks ] ++ gnome-extensions;

  dconf.settings."org/gnome/shell".enabled-extensions =
    map (pkg: pkg.extensionUuid) gnome-extensions;
}
