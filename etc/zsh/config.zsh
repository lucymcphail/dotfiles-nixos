#!/usr/bin/env zsh

# use emacs-style keys
bindkey -e

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' enable git svn
zstyle ':vcs_info:git*' formats " (%b%u%c)"
zstyle ':vcs_info:git*' actionformats " (%b%u%c %a)"
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr "?"
zstyle ':vcs_info:git*' stagedstr "+"
precmd() { vcs_info }
setopt prompt_subst

PROMPT='%F{green}%n@%m%F{white}:%F{cyan}%~%F{green}${vcs_info_msg_0_}%F{white} λ %f'

# completion
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*' group-name ''

function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

function zle_fg {
    zle_eval fg
}

zle -N zle_fg
bindkey "^z" zle_fg

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line
