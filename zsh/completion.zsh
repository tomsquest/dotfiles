# Completion configuration (compinit is called in ~/.zshrc)

# Provides the completion menu, navigable with the arrow keys (and the `menuselect` keymap used in bindkey.zsh)
zmodload -i zsh/complist

# Cache the results of slow completions (apt, dpkg...). Clear with `rm -r ~/.zshcache`
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

# Completers, tried in order:
# - _expand: expand globs and variables (eg. `ls *.txt<TAB>` lists the files)
# - _complete: the normal completion
# - _ignored: the matches ignored by other rules, if nothing else matched
# - _approximate: allow 1 typo (eg. `cd Dekstop<TAB>` -> `cd Desktop`)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Case, hyphen and underscore insensitive completion, then match inside words (eg. `foo<TAB>` -> `my-foo.txt`)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Menu: start it when there are at least 2 matches
zstyle ':completion:*' menu select=2
# Messages shown when the list is longer than the screen
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Group the matches by type, with a header per group
# Example:
#     $ ls
#     -- directory --
#     coverage/         deploy/
#     -- file --
#     deploy.yaml           http-client.env.json
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:descriptions' format '%B-- %d --%b'
zstyle ':completion:*:messages' format '%B-- %d --%b'
# No match: in red, it is an error
zstyle ':completion:*:warnings' format '%F{red}%B-- no match for:%b%f %d'

# Colors: files like `ls`, the original text (before correction) in bold, special parameters ($?, $#...) in magenta, aliases in green
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:original' list-colors '=*=1'
zstyle ':completion:*:parameters' list-colors '=[^a-zA-Z]*=35'
zstyle ':completion:*:aliases' list-colors '=*=32'

# cd never proposes the current directory (eg. `cd ../<TAB>`)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# rm: don't propose a file already on the command line
zstyle ':completion:*:rm:*' ignore-line yes

# kill/pkill/killall: list my processes, always in a menu, pids in blue
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*:processes-names' command 'ps -u $USER -o comm='
zstyle ':completion:*:processes' list-colors '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=34'
zstyle ':completion:*:(killall|pkill|kill):*' menu yes select
zstyle ':completion:*:(killall|pkill|kill):*' force-list always

# sudo: complete the commands of the system paths, even when not in my PATH
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
