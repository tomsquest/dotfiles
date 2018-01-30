#!/bin/bash

set -euo pipefail

# Fetch the code from the other Git repos like zsh-git-prompt, Vim vundle...
echo "Fetching submodules..."
git submodule update --remote --init

# Create the symlinks in $HOME
function link_if_missing() {
  SRC=$1
  DEST=$2

  mkdir -p $(dirname $DEST)
  if ! [ -L "$DEST" ]; then
    ln -ivs "$SRC" "$DEST"
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

echo "Creating additional PATH directories..."
mkdir -p "$HOME/.local/bin"

echo "Linking files..."
link_if_missing "$PWD/bin"                    "$HOME/bin"
link_if_missing "$PWD/bash"                   "$HOME/.bash"
link_if_missing "$PWD/zsh"                    "$HOME/.zsh"
link_if_missing "$PWD/vim"                    "$HOME/.vim"
link_if_missing "$PWD/bashrc"                 "$HOME/.bashrc"
link_if_missing "$PWD/ackrc"                  "$HOME/.ackrc"
link_if_missing "$PWD/gitconfig"              "$HOME/.gitconfig"
link_if_missing "$PWD/gitignore"              "$HOME/.gitignore"
link_if_missing "$PWD/imwheelrc"              "$HOME/.imwheelrc"
link_if_missing "$PWD/irbrc"                  "$HOME/.irbrc"
link_if_missing "$PWD/plsqlrc"                "$HOME/.plsqlrc"
link_if_missing "$PWD/rvmrc"                  "$HOME/.rvmrc"
link_if_missing "$PWD/tmux.conf"              "$HOME/.tmux.conf"
link_if_missing "$PWD/vimrc"                  "$HOME/.vimrc"
link_if_missing "$PWD/zshrc"                  "$HOME/.zshrc"
link_if_missing "$PWD/terminator.conf"        "$HOME/.config/terminator/config"
link_if_missing "$PWD/openbox.xml"            "$HOME/.config/openbox/lubuntu-rc.xml"
for file in $PWD/desktop-shortcuts/*
do
  link_if_missing "$file" "$HOME/.local/share/applications/$(basename "$file")"
done

echo "Installing Vim plugins..."
vim +PluginInstall +qall
