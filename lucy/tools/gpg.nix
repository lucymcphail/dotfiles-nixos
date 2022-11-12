{ pkgs, ... }:

{
	home.packages = with pkgs; [ pinentry-gnome ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "4010EEE586A8251EA17B0F3296662A42B51F0460" ];
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
