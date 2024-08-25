# zgen
source ~/.zgen/zgen.zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  # Suggests commands as you type based on history and completions.
  zgen load zsh-users/zsh-autosuggestions
  # Provides syntax highlighting for the shell zsh.
  zgen load zsh-users/zsh-syntax-highlighting
  # Provides completion from history using UP and DOWN arrows
  # MUST be after zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search
  # Provides suggested packages to be installed if a command cannot be found.
  zgen oh-my-zsh plugins/command-not-found
  # Provides ESC-ESC keybind to prepend last command with 'sudo'
  zgen oh-my-zsh plugins/sudo
  # Provides additional completions
  zgen load zsh-users/zsh-completions src
  # Enhances the terminal environment with 256 colors
  zgen load chrissicool/zsh-256color
  # Allows you to foreground the last backgrounded job (when you would normally do fg) using Ctrl+Z
  zgen load theunraveler/zsh-fancy_ctrl_z
  # Enable Q support in ZSH
  zgen load tomsquest/q.plugin.zsh

  # Remove Zsh completion cache, given we may have updated a completion
  rm ~/.zcompdump || true

  zgen save
fi

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/functions.zsh

# Load linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# Load ASDF
# Needs to be done before compinit in config.zsh
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Load direnv through asdf
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Load Jump: quickly jump to recent directory with the z command
# Adds fuzzy matching which z doesn't have
eval "$(jump shell --bind=z)"

# FZF
export FZF_DEFAULT_OPTS="--height=50% --reverse --multi --highlight-line"
export FZF_CTRL_T_OPTS="--walker-skip .git,node_modules,target --preview 'bat --style=numbers --color=always {}'"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target --preview 'tree -C {}'"
eval "$(fzf --zsh)"

# Load completions
# SHOULD BE LAST
# rm using full path to escape from safe-rm
/usr/bin/rm -f ~/.zcompdump || true
autoload -Uz compinit
compinit

# Load local (to this machine) configuration
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
