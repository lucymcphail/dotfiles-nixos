{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-space";
    clock24 = true;
    escapeTime = 0;
    terminal = "xterm-256color";

    extraConfig = builtins.readFile ../../etc/tmux/tmux.conf;
  };
}
