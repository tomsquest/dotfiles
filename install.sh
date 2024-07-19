#!/bin/bash

set -euo pipefail

function create-paths {
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

function create-links {
    echo "Creating links..."
    # directories
    create-link "$PWD/bin"                    "$HOME/bin"
    create-link "$PWD/vim"                    "$HOME/.vim"
    create-link "$PWD/zsh"                    "$HOME/.zsh"
    # files
    create-link "$PWD/bashrc"                 "$HOME/.bashrc"
    create-link "$PWD/gitconfig"              "$HOME/.gitconfig"
    create-link "$PWD/gitignore"              "$HOME/.gitignore"
    create-link "$PWD/imwheelrc"              "$HOME/.imwheelrc"
    create-link "$PWD/libinput-gestures.conf" "$HOME/.config/libinput-gestures.conf"
    create-link "$PWD/npmrc"                  "$HOME/.npmrc"
    create-link "$PWD/profile"                "$HOME/.profile"
    create-link "$PWD/pythonstartup"          "$HOME/.pythonstartup"
    create-link "$PWD/ripgreprc"              "$HOME/.ripgreprc"
    create-link "$PWD/safe-rm"                "$HOME/.safe-rm"
    create-link "$PWD/terminator.conf"        "$HOME/.config/terminator/config"
    create-link "$PWD/vimrc"                  "$HOME/.vimrc"
    create-link "$PWD/zprofile"               "$HOME/.zprofile"
    create-link "$PWD/zshrc"                  "$HOME/.zshrc"
    for file in $PWD/desktop-shortcuts/*
    do
      create-link "$file" "$HOME/.local/share/applications/$(basename "$file")"
    done
}

function install-vim-plugins {
    echo "Installing Vim plugins..."
    vim +PluginInstall +qall
}

function install-dircolors {
    echo "Installing dircolors..."
    curl -sl "https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark" > ~/.dircolors
}

function install-asdf-plugins {
    echo "Installing Direnv through asdf..."
    source $HOME/.asdf/asdf.sh
    asdf plugin add direnv || true
    asdf plugin add nodejs || true
    asdf plugin add python || true
    asdf plugin add golang || true
    asdf install direnv 2.32.1
    asdf global direnv 2.32.1
    asdf global python system
}

function install-homebrew {
    echo "Installing Home Brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install-homebrew-apps {
    echo "Installing Home Brew apps..."
    brew install bat
    brew install eza # exa is unmaintained
    brew install fd
    brew install fzf
    brew install httpie
    brew install ripgrep
    brew install jump
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
    create-paths
    create-links
    install-from-git-repo "Zgen"          "https://github.com/tarjoilija/zgen"      "$HOME/.zgen"
    install-from-git-repo "Bash-Sensible" "https://github.com/mrzool/bash-sensible" "$HOME/.bash-sensible"
    install-from-git-repo "Vim Vundle"    "https://github.com/VundleVim/Vundle.vim" "$HOME/.vundle"
    install-from-git-repo "Asdf-vm"       "https://github.com/asdf-vm/asdf"         "$HOME/.asdf"
    install-vim-plugins
    install-dircolors
    install-asdf-plugins
    install-homebrew
    install-homebrew-apps
    install-terminator-editor-plugin
    copy-sysctl-conf
}

install-all
