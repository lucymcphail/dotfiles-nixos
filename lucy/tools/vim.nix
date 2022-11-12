{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      hidden = true;
      number = true;
      ignorecase = true;
      smartcase = true;
      undofile = true;
      undodir = [ "~/.vim/undo" ];
    };

    plugins = with pkgs.vimPlugins; [
      vim-abolish
      vim-commentary
      vim-eunuch
      vim-fugitive
      vim-repeat
      vim-rsi
      vim-sensible
      vim-speeddating
      vim-surround
      vim-unimpaired
      vim-vinegar

      jellybeans-vim

      vim-gutentags
      fzf-vim

      pear-tree
      vim-lion
    ];

    extraConfig = builtins.readFile ../../etc/vim/vimrc.vim;
  };

  home.packages = [ pkgs.universal-ctags ];
}
