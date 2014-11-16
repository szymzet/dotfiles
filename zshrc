source /opt/boxen/env.sh

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


#
# aliases
#

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#
# development aliases
#
alias be='bundle exec'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate'
alias rollback='bundle exec rake db:rollback'

alias g="git"
alias gls="git ls -20"
alias gbr="git branch"
alias gco="git checkout"
alias gdf="git diff"
alias gmg="git merge"
alias grb="git rebase"
alias gst="git st"
alias gpr="git pull --rebase"
alias gpo="git push origin"
alias grs="git reset"
alias gci="git commit"
alias gaa="git add --all"

alias rspec='nocorrect rspec'
alias git='nocorrect git'
alias bundle='nocorrect bundle'

# start new tmux session named after current directory
mux() {
    tmux new -s $(basename $(pwd))
}

# create a directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}


#
# export variables
#
export PATH="${PATH}":"${HOME}"/bin:"${HOME}"/scripts
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home"
export EDITOR="vim"
