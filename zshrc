source ~/.zshenv

# do nothing if not in interactive session
case $- in
    *i*) ;;
      *) return;;
esac

#
# Mac OS X specific
# 
export LANG=pl_PL.UTF-8
export LC_ALL=pl_PL.UTF-8

[[ -s `brew --prefix`/Cellar/autojump/21.7.1/etc/autojump.zsh ]] && . `brew --prefix`/Cellar/autojump/21.7.1/etc/autojump.zsh

# enable colors for OS X
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# shell options
#
setopt appendhistory
setopt autocd
setopt extendedglob
setopt correctall
setopt hist_ignore_all_dups
setopt extendedglob
setopt prompt_subst

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
bindkey -e

#
# completions
#
fpath=(/opt/boxen/homebrew/share/zsh-completions $fpath)
autoload -U compinit && compinit

#
# propmpt
#
autoload -U promptinit && promptinit

autoload -Uz vcs_info
zstyle ':vcs_info:' enable git

autoload -U colors && colors

# set the prompt
__git_prompt() {
  echo $(git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/')
}

NEWLINE=$'\n'
PROMPT='%{${fg_bold[red]}%}%n:%~%{${fg[blue]}${reset_color}%} $(__git_prompt)${NEWLINE}\$ '
RPROMPT='%{$fg[blue]%}$(__git_prompt)%{$reset_color%}'


# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
