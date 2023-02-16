{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableSyntaxHighlighting = true;

    initExtra = builtins.readFile ../../etc/zsh/config.zsh;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      l = "ls -al";
      e = "emacsclient";
      ec = "emacsclient -c";
      g = "git";

      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };

  programs.zoxide.enable = true;

  home.packages = with pkgs; [ fzf ];
}
