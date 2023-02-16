{ pkgs, config, ... }:

let
  pass = "${config.programs.password-store.package}/bin/pass";
  common = {
    mbsync = {
      enable = true;
      create = "maildir";
      expunge = "both";
      extraConfig.account = {
        AuthMechs = "XOAUTH2";
      };
    };
    msmtp.enable = true;

    mu.enable = true;
  };
in
{
  programs.password-store.enable = true;

  accounts.email = {
    maildirBasePath = "mail";
    accounts = {
      personal = rec {
        primary = true;
        address = "lucy.mcphail.p@gmail.com";
        flavor = "gmail.com";
        passwordCommand = "${pass} ${address}";
      } // common;
      university = rec {
        address = "L.R.McPhail@sms.ed.ac.uk";
        flavor = "outlook.office365.com";
        userName = "s2079454@ed.ac.uk";
        passwordCommand = "${pass} ${address}";
      } // common;
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.mu.enable = true;

  home.packages = [ pkgs.thunderbird-wayland ];
}
