#!/usr/bin/env bash

for file in *; do
    target="${HOME}/.${file}"
    if [[ -e "${target}" ]]; then
        if [[ ! -L "${target}" ]]; then
            echo "WARNING: ${file} exists but is not a symlink"
        else
            echo " - Already exists: ${file}"
        fi
    elif [[ "${file}" != "install.bash" ]]; then
        echo " - Creating: ${file}"
        ln -s "${PWD}/${file}" "${target}"
    fi
done

if [[ ! -e ~/.vim/bundle/vundle ]]; then
    echo " - Initializing Vundle for Vim"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim -u ~/.vimrc.bundles +BundleInstall +qa
else
    echo " - Vundle for Vim already initialized"
fi

if [[ -e ~/.zshrc ]]; then
  ln -s "${HOME}/.zshrc" "${HOME}/.zprofile"
fi
