# Don't let zgen call compinit, it is done (with a cache) at the end of this file
ZGEN_AUTOLOAD_COMPINIT=0
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
  # Allows you to foreground the last backgrounded job (when you would normally do fg) using Ctrl+Z
  zgen load theunraveler/zsh-fancy_ctrl_z
  # Enable Q support in ZSH
  zgen load tomsquest/q.plugin.zsh

  # Remove Zsh completion cache, given we may have updated a completion
  /usr/bin/rm ~/.zcompdump || true

  zgen save
fi

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/functions.zsh

# Starship prompt
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"
eval "$(starship init zsh)"

# Jump: quickly jump to recent directory with the z command
# Adds fuzzy matching which zoxide does not have
eval "$(jump shell --bind=z)"

# FZF
export FZF_DEFAULT_OPTS="--height=50% --reverse --multi --highlight-line"
export FZF_CTRL_T_OPTS="--walker-skip .git,node_modules,target,.venv --preview 'bat --style=numbers --color=always {}'"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target,.venv --preview 'tree -C {}'"
source <(fzf --zsh)

# Local configuration (to this machine)
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Completions
# SHOULD BE LAST
autoload -Uz compinit
# Anonymous function to enable extendedglob (needed by the `(#q...)` glob qualifier) only locally,
# as enabling it globally breaks commands like `git reset HEAD^`
() {
  setopt local_options extended_glob
  if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
    # Skip checks and just load the cache if it's less than 24 hours old
    compinit -C
  else
    compinit
    # compinit does not rewrite the dump when nothing changed: refresh its date to use the cache for the next 24 hours
    touch ~/.zcompdump
  fi
}
