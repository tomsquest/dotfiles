source ~/.zsh/config
source ~/.zsh/completion
source ~/.zsh/aliases
source ~/.zsh/bindkey
source ~/.zsh/prompt

for f in ~/.zsh/functions/*; do
  source $f
done

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

source ~/.zsh/rvm