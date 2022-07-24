# Setting workstation up

 - install homebrew
 - `brew install git rg fzf rbenv`
 - install iTerm2
 - install sensible ruby version and set as global `rbenv install 2.7.6 && rbenv global 2.7.6`
 - install pry: `gem install pry`
 - install oh my zsh
   - substitute plugins definition in .zshrc with `source $HOME/code/dotfiles/oh-my-zsh-plugins.sh`
   - substitute user configuration with `source $HOME/code/dotfiles/zshrc`
 - link files: `f=gitconfig && ln -s ${PWD}/${f} ${HOME}/.${f}`

# Installation

Change current directory to this repo's root and run.

```shell
bash ./install.bash
```
