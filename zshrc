source ~/.zsh/config
source ~/.zsh/completion
source ~/.zsh/aliases
source ~/.zsh/bindkey
source ~/.zsh/prompt
source ~/.zsh/rvm

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
