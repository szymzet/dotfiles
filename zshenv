source /opt/boxen/env.sh

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

#
# export variables
#
export PATH="${PATH}":"${HOME}"/bin:"${HOME}"/scripts
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home"
export EDITOR="vim"

