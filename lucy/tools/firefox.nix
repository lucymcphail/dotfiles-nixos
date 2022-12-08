{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-wayland;

    profiles.lucy = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome =
        ''
        #TabsToolbar {
          visibility: collapse;
        }

        #sidebar-header {
          visibility: collapse !important;
        }
        '';
    };
  };
}
