# RVM ZSH Integration
# http://beginrescueend.com/integration/zsh/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Required when opening a new tab, RVM should be "reloaded"
__rvm_project_rvmrc

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
