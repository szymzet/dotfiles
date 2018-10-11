# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#
# config taken from mrzool/bash-sensible github repo
#
# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2

# Unique Bash version check
if ((BASH_VERSINFO[0] < 4))
then 
  echo "sensible.bash: Looks like you're running an older version of Bash." 
  echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly." 
  echo "sensible.bash: Keep your software up-to-date!"
fi

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##


#
# END OF config taken from mrzool/bash-sensible github repo
#

export IGNOREEOF=9  # Ctrl-D 9 times to kill session :D

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"


# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

if [[ -e /usr/local/bin/brew ]]; then
  for f in /usr/local/etc/bash_completion.d/*; do
    source $f
  done

  __git_complete g __git_main
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

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

alias g=git
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
alias gd="git diff --color=always | less -r"

gdfo() { # diff origin
    local branch=$(gbr | grep '*' | cut -d' ' -f2)
    gdf origin/${branch}..${branch}
}

glso() { # ls origin
    local branch=$(gbr | grep '*' | cut -d' ' -f2)
    gls origin/${branch}..${branch}
}

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

alias gr="RBENV_VERSION=2.3.7 grid"
alias grc="gr console"
alias grd="gr deploy"
alias dr="goship"
alias s3="aws s3"

# enable colors for OS X
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA_HOME=$(/usr/libexec/java_home)

export EDITOR=vim
export VISUAL=$EDITOR

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export NVM_DIR="/Users/szymzet/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

export LANG=en_US.UTF-8
