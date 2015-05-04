zmodload -i zsh/complist

# Enable completion caching, use rehash to clear
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion menu
# ‘select=num’, menu selection will only be started if there are at least num matches.
zstyle ':completion:*' menu select=2

# cd will never select the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Fallback to built in ls colors
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''

# Kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Avoid twice the same element on rm
zstyle ':completion:*:rm:*' ignore-line yes

# Completion for sudo when the command is not in the current path
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin