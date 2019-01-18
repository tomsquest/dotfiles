#!/bin/bash

set -euo pipefail

function make-paths {
    echo "Creating additional PATH directories..."
    mkdir -p "$HOME/.local/bin"
    echo "Creating additional MANPATH directories..."
    mkdir -p "$HOME"/.local/man/man{1..8}
}

function create-link {
  local -r SRC=$1
  local -r DEST=$2

  mkdir -p "$(dirname "$DEST")"
  if ! [ -L "$DEST" ]; then
    ln -ivs "$SRC" "$DEST"
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

function install-from-git-repo {
    local -r name="$1"
    local -r repo="$2"
    local -r dest="$3"

    echo "Installing $name..."
    if [ -d "$dest" ]; then
      (cd "$dest" && git pull --progress)
    else
      rm -rf "$dest"
      git clone --progress "$repo" "$dest"
    fi
}

function link-files {
    echo "Linking files..."
    create-link "$PWD/bin"                    "$HOME/bin"
    create-link "$PWD/zsh"                    "$HOME/.zsh"
    create-link "$PWD/vim"                    "$HOME/.vim"
    create-link "$PWD/albertignore"           "$HOME/.albertignore"
    create-link "$PWD/bashrc"                 "$HOME/.bashrc"
    create-link "$PWD/gitconfig"              "$HOME/.gitconfig"
    create-link "$PWD/gitignore"              "$HOME/.gitignore"
    create-link "$PWD/imwheelrc"              "$HOME/.imwheelrc"
    create-link "$PWD/profile"                "$HOME/.profile"
    create-link "$PWD/ripgreprc"              "$HOME/.ripgreprc"
    create-link "$PWD/rvmrc"                  "$HOME/.rvmrc"
    create-link "$PWD/vimrc"                  "$HOME/.vimrc"
    create-link "$PWD/zshrc"                  "$HOME/.zshrc"
    create-link "$PWD/libinput-gestures.conf" "$HOME/.config/libinput-gestures.conf"
    create-link "$PWD/safe-rm"                "$HOME/.config/safe-rm"
    create-link "$PWD/terminator.conf"        "$HOME/.config/terminator/config"
    create-link "$PWD/openbox.xml"            "$HOME/.config/openbox/lubuntu-rc.xml"
    for file in $PWD/desktop-shortcuts/*
    do
      create-link "$file" "$HOME/.local/share/applications/$(basename "$file")"
    done
}

function install-fzf {
    echo "Installing FZF..."
    local -r URL=$(curl -s https://api.github.com/repos/junegunn/fzf-bin/releases/latest | grep browser_download_url | grep linux_amd64 | cut -d '"' -f 4)
    echo "- Binary"
    curl -sL "$URL" | tar xz -C /tmp fzf  && mv /tmp/fzf $HOME/.local/bin/

    echo "- Man page"
    curl -sL "https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1" > $HOME/.local/man/man1/fzf.1

    mkdir -p $HOME/.local/fzf
    echo "- Completion"
    curl -sL "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh" > $HOME/.local/fzf/completion.zsh

    echo "- Key bindings"
    curl -sL "https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh" > $HOME/.local/fzf/key-bindings.zsh
}

function install-ripgrep {
    echo "Installing Ripgrep..."
    local -r TMP_DIR=$(mktemp -d)
    local -r URL=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep browser_download_url | grep x86_64-unknown-linux | cut -d '"' -f 4)
    curl -sL "$URL" | tar zx -C "$TMP_DIR" --strip 1 --wildcards '*/rg' --wildcards '*/rg.1' \
       && mv "$TMP_DIR/rg" $HOME/.local/bin/ \
       && mv "$TMP_DIR/doc/rg.1" $HOME/.local/man/man1 \
       && rm -rf "$TMP_DIR"
}

function install-docker-compose {
    echo "Installing Docker-Compose..."
    local -r URL=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url | grep Linux-x86_64\" | cut -d '"' -f 4)
    local -r DEST="$HOME/.local/bin/docker-compose"
    curl -sL "$URL" > "$DEST" \
      && chmod +x "$DEST"
}

function install-direnv {
    echo "Installing Direnv..."
    local -r URL=$(curl -s https://api.github.com/repos/direnv/direnv/releases/latest | grep browser_download_url | grep linux-amd64\" | cut -d '"' -f 4)
    local -r DEST="$HOME/.local/bin/direnv"
    curl -sL "$URL" > "$DEST" \
      && chmod +x "$DEST"
}

function install-vim-plugins {
    echo "Installing Vim plugins..."
    vim +PluginInstall +qall
}

function install-dircolors {
    echo "Installing dircolors..."
    curl -sl "https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark" > ~/.dircolors
}

function copy-sysctl-conf {
    echo "Copying sysctl config files..."
    for file in $PWD/sysctl.d/*
    do
      sudo cp "$file" "/etc/sysctl.d/$(basename "$file")"
    done
}

function install-all {
    make-paths
    link-files
    install-from-git-repo "Rupa-Z"        "https://github.com/rupa/z"               "$HOME/.rupa-z"
    install-from-git-repo "Zgen"          "https://github.com/tarjoilija/zgen"      "$HOME/.zgen"
    install-from-git-repo "Bash-Sensible" "https://github.com/mrzool/bash-sensible" "$HOME/.bash-sensible"
    install-from-git-repo "Vim Vundle"    "https://github.com/VundleVim/Vundle.vim" "$HOME/.vundle"
    install-fzf
    install-ripgrep
    install-docker-compose
    install-direnv
    install-vim-plugins
    install-dircolors
    copy-sysctl-conf
}

install-all
