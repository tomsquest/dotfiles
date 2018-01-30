#!/bin/bash

set -euo pipefail

function install-submodules {
    echo "Fetching submodules..."
    git submodule update --remote --init
}

function mkdir-paths {
    echo "Creating additional PATH directories..."
    mkdir -p "$HOME/.local/bin"
}

function create-link {
  SRC=$1
  DEST=$2

  mkdir -p $(dirname $DEST)
  if ! [ -L "$DEST" ]; then
    ln -ivs "$SRC" "$DEST"
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

function install-fzf {
    echo "Installing FZF..."
    readonly URL=$(curl -s https://api.github.com/repos/junegunn/fzf-bin/releases/latest | grep browser_download_url | grep linux_amd64 | cut -d '"' -f 4)
    curl -sL "$URL" | tar xz fzf -C /tmp \
        && mv fzf ~/.local/bin/
}

function link-files {
    echo "Linking files..."
    create-link "$PWD/bin"                    "$HOME/bin"
    create-link "$PWD/bash"                   "$HOME/.bash"
    create-link "$PWD/zsh"                    "$HOME/.zsh"
    create-link "$PWD/vim"                    "$HOME/.vim"
    create-link "$PWD/bashrc"                 "$HOME/.bashrc"
    create-link "$PWD/ackrc"                  "$HOME/.ackrc"
    create-link "$PWD/gitconfig"              "$HOME/.gitconfig"
    create-link "$PWD/gitignore"              "$HOME/.gitignore"
    create-link "$PWD/imwheelrc"              "$HOME/.imwheelrc"
    create-link "$PWD/irbrc"                  "$HOME/.irbrc"
    create-link "$PWD/plsqlrc"                "$HOME/.plsqlrc"
    create-link "$PWD/rvmrc"                  "$HOME/.rvmrc"
    create-link "$PWD/tmux.conf"              "$HOME/.tmux.conf"
    create-link "$PWD/vimrc"                  "$HOME/.vimrc"
    create-link "$PWD/zshrc"                  "$HOME/.zshrc"
    create-link "$PWD/terminator.conf"        "$HOME/.config/terminator/config"
    create-link "$PWD/openbox.xml"            "$HOME/.config/openbox/lubuntu-rc.xml"
    for file in $PWD/desktop-shortcuts/*
    do
      create-link "$file" "$HOME/.local/share/applications/$(basename "$file")"
    done
}

function install-vim-plugins {
    echo "Installing Vim plugins..."
    vim +PluginInstall +qall
}

function main {
    mkdir-paths
    link-files
    install-fzf
    install-submodules
    install-vim-plugins
}

main