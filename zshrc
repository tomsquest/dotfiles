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

# Load ASDF
# Needs to be done before compinit in config.zsh
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/fzf.zsh

# Load Zoxide: quickly jump to recent directory with the z command
eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/tom/Apps/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/tom/Apps/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/home/tom/Apps/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/tom/Apps/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# Load direnv through asdf
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Local (to this machine) configuration
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
