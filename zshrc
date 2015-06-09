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
setopt ignoreeof
export IGNOREEOF=5 # Shell only exists after the nth consecutive Ctrl-d

HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
bindkey -e

#
# completions
#
fpath=($(brew --prefix)/share/zsh-completions $fpath)
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

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

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
alias gdfc="git diff --cached --color | less -r"
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
alias ssh='nocorrect ssh'

alias gr="RBENV_VERSION=2.1.5 grid"
alias dr="RBENV_VERSION=2.1.5 dropship"

gdfo() {
  local branch=$(gbr | grep '*' | cut -d' ' -f2)
  gdf origin/${branch}..${branch}
}

glso() {
  local branch=$(gbr | grep '*' | cut -d' ' -f2)
  gls origin/${branch}..${branch}
}


# start new tmux session named after current directory
mux() {
    tmux new -s $(basename $(pwd))
}

# create a directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}


[[ -s /opt/starter-kit-cli/extras/starter-kit-cli-extras.sh ]] && . /opt/starter-kit-cli/extras/starter-kit-cli-extras.sh

export JAVA_HOME=$(/usr/libexec/java_home)
