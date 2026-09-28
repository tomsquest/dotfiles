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
    create-link "$PWD/nvim"                   "$HOME/.config/nvim"
    create-link "$PWD/npmrc"                  "$HOME/.npmrc"
    create-link "$PWD/profile"                "$HOME/.profile"
    create-link "$PWD/safe-rm"                "$HOME/.safe-rm"
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
}

function install-apt-packages {
    echo "Installing apt packages..."
    # safe-rm: safer rm, for not crying in despair after `rm -rf /home/tom /something` (notice the space)
    # libnotify-bin: `notify-send`, used by `alert`
    # ffmpeg: `ffplay` used by `beep`, and `compress-videos`
    # build-essential, curl, git: required by Home Brew
    sudo apt update
    sudo apt install --yes \
        zsh \
        git \
        curl \
        build-essential \
        safe-rm \
        jq \
        wl-clipboard \
        htop \
        tree \
        libnotify-bin \
        ffmpeg \
        git-lfs
}

function install-homebrew {
    if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        echo "Skipping, Home Brew already installed"
    else
        echo "Installing Home Brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Add brew (and the apps it installs, eg. asdf) to the PATH of this script
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

function install-homebrew-apps {
    echo "Installing Home Brew apps..."
    brew install asdf
    brew install bat
    brew install btop
    brew install direnv
    brew install dust
    brew install eza # exa is unmaintained
    brew install fd
    brew install fzf
    brew install gh
    brew install httpie
    brew install jump
    brew install just
    brew install k9s
    brew install kubectx
    brew install kubernetes-cli
    brew install neovim
    brew install opencode
    brew install pnpm
    brew install ripgrep
    brew install starship
    brew install tree-sitter-cli # for nvim-treesitter
    brew install uv
}

function install-font {
    local -r dest="$HOME/.local/share/fonts/JetBrainsMono"
    if [ -d "$dest" ]; then
        echo "Skipping, JetBrainsMono Nerd Font already installed"
        return
    fi
    echo "Installing JetBrainsMono Nerd Font..."
    mkdir -p "$dest"
    curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz" | tar -xJ -C "$dest"
    fc-cache -f "$dest"
}

function set-zsh-as-default-shell {
    if [ "$(getent passwd "$USER" | cut -d: -f7)" = "/usr/bin/zsh" ]; then
        echo "Skipping, zsh is already the default shell"
    else
        echo "Setting zsh as default shell..."
        chsh -s /usr/bin/zsh
    fi
}

function install-all {
    install-apt-packages
    create-links
    install-from-git-repo "Zgenom"        "https://github.com/jandamm/zgenom"       "$HOME/.zgenom"
    install-from-git-repo "Bash-Sensible" "https://github.com/mrzool/bash-sensible" "$HOME/.bash-sensible"
    install-homebrew
    install-homebrew-apps
    install-asdf-plugins
    install-font
    set-zsh-as-default-shell
}

install-all
