{ config, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;

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

      nupdate = "sudo nixos-rebuild switch --flake ~/dotfiles";
      hmupdate = "home-manager switch --flake ~/dotfiles";

      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
