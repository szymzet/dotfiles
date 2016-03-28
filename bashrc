# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export IGNOREEOF=9  # Ctrl-D 9 times to kill session :D

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# MAC OS X
# source /opt/boxen/homebrew/etc/bash_completion.d/git-completion.bash
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

# set the prompt
PS1='\[\033[01;31m\]\u:\w\[\033[01;34m\] $(__git_ps1)\[\033[00m\]\n$ '

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ruby/git aliases and stuff
alias be='bundle exec'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate'
alias rollback='bundle exec rake db:rollback'

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

gdfo() { # diff origin
    local branch=$(gbr | grep '*' | cut -d' ' -f2)
    gdf origin/${branch}..${branch}
}

glso() { # ls origin
    local branch=$(gbr | grep '*' | cut -d' ' -f2)
    gls origin/${branch}..${branch}
}

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /usr/share/autojump/autojump.bash ]; then
    . /usr/share/autojump/autojump.bash
fi

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# create a directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

eval "$(rbenv init -)"

# work stuff
alias gr="RBENV_VERSION=2.1.5 grid"
alias grc="gr console"
alias grd="gr deploy"
alias dr="RBENV_VERSION=2.1.5 dropship"

grdperf() {
  echo "Running gr deploy ${1} staging eu-cental-1"
  gr deploy $1 staging eu-central-1
}

grcperf() {
  echo "Running gr console ${1} staging eu-cental-1"
  gr console $1 staging eu-central-1
}

# MAC OS X
# export LANG=pl_PL.UTF-8
# export LC_ALL=pl_PL.UTF-8

if [[ -e /usr/local/bin/brew ]]; then
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    [[ -s `brew --prefix`/etc/bash_completion.d/git-completion.bash ]] && . `brew --prefix`/etc/bash_completion.d/git-completion.bash
    [[ -s `brew --prefix`/etc/bash_completion.d/lein-completion.bash ]] && . `brew --prefix`/etc/bash_completion.d/lein-completion.bash
fi

[[ -s /opt/starter-kit-cli/extras/starter-kit-cli-extras.sh ]] && . /opt/starter-kit-cli/extras/starter-kit-cli-extras.sh

# enable colors for OS X
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA_HOME=$(/usr/libexec/java_home)

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi