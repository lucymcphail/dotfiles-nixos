{ pkgs, config, ... }:

let
  pass = "${config.programs.password-store.package}/bin/pass";
  common = {
    mbsync = {
      enable = true;
      create = "maildir";
      expunge = "both";
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

        imap.host = "imap.gmail.com";
        smtp = {
          host = "smtp.gmail.com";
          tls.enable = true;
        };
        userName = address;
        passwordCommand = "${pass} ${imap.host}/${address}";
      } // common;
      university = rec {
        address = "L.R.McPhail@sms.ed.ac.uk";

        imap.host = "outlook.office365.com";
        smtp = {
          host = "smtp.office365.com";
          tls.enable = true;
          tls.useStartTls = true;
        };
        userName = "s2079454@ed.ac.uk";
        passwordCommand = "${pass} ${imap.host}/${address}";
      } // common;
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.mu.enable = true;

}
