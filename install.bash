#!/usr/bin/env bash
set -e

function log {
    printf "${1}\n"
}

function warn {
    RED='\033[0;31m'
    NOCOLOR='\033[0m'
    printf "${RED}${1}${NOCOLOR}\n"
}

function info {
    BLUE='\033[0;34m'
    NOCOLOR='\033[0m'
    printf "${BLUE}${1}${NOCOLOR}\n"
}

function symlink_simple_dotfiles {
    local file=""
    local target=""
    local simple_dotfiles=(bashrc gitconfig pryrc tmux.conf vimrc vimrc.bundles zshenv zshrc spacemacs)

    log "Creating symlinks for simple dotfiles"

    for file in "${simple_dotfiles[@]}"; do
        target="${HOME}/.${file}"

        if [[ -e "${target}" ]]; then
            if [[ ! -L "${target}" ]]; then
                warn "exists but is not a symlink: ${target}"
            else
                info "symlink exists: ${target}"
            fi
        else
            info "symlinking ${target}"
            ln -s "${PWD}/${file}" "${target}"
        fi
    done

    log ""
}

function initialize_vim_vundle {
    log "Initializing Vundle for Vim"

    if [[ ! -e ~/.vim/bundle/vundle ]]; then
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        vim -u ~/.vimrc.bundles +BundleInstall +qa
    else
        info "Vundle for Vim already initialized"
    fi
    log ""
}

function symlink_zshrc_to_zprofile {
    log "Symlink .zprofile to .zshrc"
    if [[ -e ~/.zshrc ]]; then
        if [[ -e ~/.zprofile ]]; then
            warn "failed because ~/.zprofile exists"
        else
            ln -s "${HOME}/.zshrc" "${HOME}/.zprofile"
        fi
    fi
    log ""
}

function symlink_bashrc_to_profile {
    log "Symlink .profile to .bashrc"
    if [[ -e ~/.bashrc ]]; then
        if [[ -e ~/.profile ]]; then
            warn "failed because ~/.profile exists"
        else
            ln -s "${HOME}/.bashrc" "${HOME}/.profile"
        fi
    fi
    log ""
}

function back_up_if_exists_in_home {
    local full_path="${HOME}/${1}"
    if [[ -e "${full_path}" ]]; then
        local date_suffix=$(date +"%Y-%m-%d")
        local backed_up_path="${full_path}-backup-${date_suffix}"
        warn "backing up ${full_path} to ${backed_up_path}"
        mv -f "${full_path}" "${backed_up_path}"
    fi
}

function setup_emacs_with_prelude {
    log "Setting up Emacs with Prelude"
    back_up_if_exists_in_home ".emacs"
    back_up_if_exists_in_home ".init.el"
    back_up_if_exists_in_home ".emacs.d"

    local emacs_home="${HOME}/.emacs.d"
    info "Cloning prelude repo"
    git clone git@github.com:bbatsov/prelude.git $emacs_home

    info "Symlinking personalizations"

    rm -rf "${emacs_home}/personal"
    ln -s "${PWD}/emacs-prelude/personal" "${emacs_home}/personal"

    rm -rf "${emacs_home}/prelude-modules.el"
    ln -s "${PWD}/emacs-prelude/prelude-modules.el" $emacs_home

    rm -rf "${emacs_home}/snippets"
    ln -s "${PWD}/emacs-prelude/snippets" "${emacs_home}/snippets"
}

################################################################################

symlink_simple_dotfiles
initialize_vim_vundle
symlink_zshrc_to_zprofile
symlink_bashrc_to_profile
