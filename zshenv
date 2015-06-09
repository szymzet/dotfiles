if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

#
# export variables
#
export PATH="${HOME}/.bin:/usr/local/sbin:${PATH}"
export EDITOR="emacs"
export VISUAL=$EDITOR

