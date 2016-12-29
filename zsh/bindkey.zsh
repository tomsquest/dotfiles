# Standard and additional keybindings:
#   ctrl + u     : clear line
#   ctrl + w     : delete word backward
#   alt  + d     : delete word
#   ctrl + a     : move to beginning of line
#   ctrl + e     : move to end of line (e for end)
#   alt/ctrl + f : move to next word (f for forward)
#   alt/ctrl + b : move to previous word (b for backward)
#   ctrl + d     : delete char at current position (d for delete)
#   ctrl + k     : delete from character to end of line
#   alt  + .     : cycle through previous args

# Emacs style bindings (for Home/End keys...)
bindkey -e

# In menu completion, the Return key will accept the current selected match
bindkey -M menuselect '^M' .accept-line

# shift-tab : go backward in menu (invert of tab)
bindkey '^[[Z' reverse-menu-complete

# alt-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

# ctrl+b/f or ctrl+left/right : move word by word (backward/forward)
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Ctrl+space : print Git/Svn status or list files with ls
vcs-status() {
  \print; zle accept-line;
  if [ -d .git ]; then
    git status --short
  elif [ -d .svn ]; then
    svn status
  else
    l # use the "l" alias for ls
  fi
  zle accept-line
}
zle -N vcs-status
bindkey '^ ' vcs-status

# Disable the capslock key and map it to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
setopt noflowcontrol
