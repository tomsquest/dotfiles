# Don't let zgenom call compinit, it is done below
ZGEN_AUTOLOAD_COMPINIT=0
source ~/.zgenom/zgenom.zsh
if ! zgenom saved; then
  echo "Creating a zgenom save"

  # Suggests commands as you type based on history and completions.
  zgenom load zsh-users/zsh-autosuggestions
  # Provides syntax highlighting for the shell zsh.
  zgenom load zsh-users/zsh-syntax-highlighting
  # Provides completion from history using UP and DOWN arrows
  # MUST be after zsh-syntax-highlighting
  zgenom ohmyzsh plugins/history-substring-search
  # Provides ESC-ESC keybind to prepend last command with 'sudo'
  zgenom ohmyzsh plugins/sudo
  # Provides additional completions
  zgenom load zsh-users/zsh-completions src
  # Allows you to foreground the last backgrounded job (when you would normally do fg) using Ctrl+Z
  zgenom load theunraveler/zsh-fancy_ctrl_z
  # Enable Q support in ZSH
  zgenom load tomsquest/q.plugin.zsh

  # Remove Zsh completion cache, given we may have updated a completion
  /usr/bin/rm ~/.zcompdump || true

  # extendedglob is required by `zgenom compile` (called by save), otherwise no plugin is compiled
  () { setopt local_options extended_glob; zgenom save }
fi

# Completions
# After zgenom (plugins add completions to fpath), before the files using `compdef` (eg. aliases.zsh)
autoload -Uz compinit
compinit
# Compile the completion cache (faster to load). zsh ignores the .zwc when older than the cache
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile ~/.zcompdump

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
