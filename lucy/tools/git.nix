{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    package = pkgs.gitAndTools.gitFull;

    userName = "Lucy McPhail";
    userEmail = "lucy.mcphail.p@gmail.com";

    aliases = {
      s = "status";
      l = "log --decorate --oneline --graph";
      amend = "commit --amend --reuse-message=HEAD";
      contributors = "shortlog --summary --numbered";
    };

    ignores = [ "*~" "*.swp""tags" ];

    signing = {
      signByDefault = true;
      key = "BADBB9BF44242475";
    };

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      advice.statusHints = false;
      branch.sort = "-committerdate";
      push.default = "tracking";
    };
  };
}
