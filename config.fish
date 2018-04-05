if test -d ~/.config/fish/functions
  for f in ~/.config/fish/functions/*.fish
    source $f
  end
end

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias be='bundle exec'

alias g=git

# work stuff
alias gr="env RBENV_VERSION=2.1.5 grid"
alias grc="gr console"
alias grd="gr deploy"
alias dr="goship"

set -gx JAVA_HOME (/usr/libexec/java_home)

# Allow 256 colors in iTerm2 for pretty vim colors
set -gx CLICOLOR 1
set -gx TERM xterm-256color
set -g fish_user_paths "/usr/local/opt/mysql@5.5/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
