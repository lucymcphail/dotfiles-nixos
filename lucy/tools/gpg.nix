{ pkgs, ... }:

{
	home.packages = with pkgs; [ pinentry-gnome ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    # pinentryFlavor = "gnome3";
  };

  programs =
    let
      fixGpg = ''
        gpgconf --launch gpg-agent
      ''; in
    {
      bash.profileExtra = fixGpg;
      fish.loginShellInit = fixGpg;
      zsh.loginExtra = fixGpg;

      gpg.enable = true;
    };
}
