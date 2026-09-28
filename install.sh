#!/bin/bash

set -euo pipefail

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

function create-links {
    echo "Creating links..."
    # directories
    create-link "$PWD/bin"                    "$HOME/bin"
    create-link "$PWD/zsh"                    "$HOME/.zsh"
    # files
    create-link "$PWD/bashrc"                 "$HOME/.bashrc"
    create-link "$PWD/ghostty-config"         "$HOME/.config/ghostty/config"
    create-link "$PWD/gitconfig"              "$HOME/.gitconfig"
    create-link "$PWD/gitignore"              "$HOME/.gitignore"
    create-link "$PWD/libinput-gestures.conf" "$HOME/.config/libinput-gestures.conf"
    create-link "$PWD/nvim"                   "$HOME/.config/nvim"
    create-link "$PWD/npmrc"                  "$HOME/.npmrc"
    create-link "$PWD/profile"                "$HOME/.profile"
    create-link "$PWD/ripgreprc"              "$HOME/.ripgreprc"
    create-link "$PWD/safe-rm"                "$HOME/.safe-rm"
    create-link "$PWD/terminator.conf"        "$HOME/.config/terminator/config"
    create-link "$PWD/zshenv"                 "$HOME/.zshenv"
    create-link "$PWD/zshrc"                  "$HOME/.zshrc"
    for file in $PWD/desktop-shortcuts/*
    do
      create-link "$file" "$HOME/.local/share/applications/$(basename "$file")"
    done
}

function install-asdf-plugins {
    asdf plugin add golang || true
    asdf plugin add nodejs || true
    asdf plugin add python || true
    asdf plugin add ruby || true
}

function install-homebrew {
    echo "Installing Home Brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install-homebrew-apps {
    echo "Installing Home Brew apps..."
    brew install asdf
    brew install bat
    brew install direnv
    brew install eza # exa is unmaintained
    brew install fd
    brew install fzf
    brew install httpie
    brew install jump
    brew install neovim
    brew install tree-sitter-cli # for nvim-treesitter
    brew install ripgrep
    brew install starship
}

function install-terminator-editor-plugin {
    echo "Installing Terminator Editor plugin..."
    mkdir -p ~/.config/terminator/plugins
    curl -sl "https://raw.githubusercontent.com/mchelem/terminator-editor-plugin/master/editor_plugin.py" > ~/.config/terminator/plugins/editor_plugin.py
}

function copy-sysctl-conf {
    echo "Copying sysctl config files..."
    for file in $PWD/sysctl.d/*
    do
      sudo cp "$file" "/etc/sysctl.d/$(basename "$file")"
    done
}

function install-all {
    create-links
    install-from-git-repo "Zgenom"        "https://github.com/jandamm/zgenom"       "$HOME/.zgenom"
    install-from-git-repo "Bash-Sensible" "https://github.com/mrzool/bash-sensible" "$HOME/.bash-sensible"
    install-homebrew
    install-homebrew-apps
    install-asdf-plugins
    install-terminator-editor-plugin
    copy-sysctl-conf
}

install-all
