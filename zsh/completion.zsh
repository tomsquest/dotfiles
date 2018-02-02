zmodload -i zsh/complist

# Enable completion caching, use rehash to clear
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# The name of the tag for the matches will be used as the name of the group
zstyle ':completion:*' group-name ''

# Menu friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Zhen there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion menu
# ‘select=num’, menu selection will only be started if there are at least num matches.
zstyle ':completion:*' menu select=2 _complete _ignored _approximate
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"

# All messages not formatted in bold prefixed with ----
zstyle ':completion:*' format '%B---- %d%b'

# format descriptions (notice the vt100 escapes)
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# Normal messages
zstyle ':completion:*:messages' format '%B---- %d%b'

# Error messages
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"

# cd will never select the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Kill completion
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*:processes-names' command 'ps -u $USER -o comm='
zstyle ':completion:*:processes' list-colors '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:(killall|pkill|kill):*' menu yes select
zstyle ':completion:*:(killall|pkill|kill):*' force-list always

# Avoid twice the same element on rm
zstyle ':completion:*:rm:*' ignore-line yes

# Completion for sudo when the command is not in the current path
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
