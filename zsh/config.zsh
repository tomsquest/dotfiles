#
# History
#
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
# Share history between multiple terminal sessions
setopt share_history
# Append history, instead of replace, when a terminal session exits
setopt appendhistory
# Add commands as they are typed, don't wait until shell exit
setopt inc_append_history
# Ignore commands with a space before
setopt hist_ignore_space
# Remove the old entry and append the new one
setopt hist_ignore_all_dups
# When searching history don't display results already cycled through twice
setopt hist_find_no_dups
# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks
# Add timestamps to history
setopt extended_history


#
# Options
#

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt prompt_subst
# Allow completion from within a word/phrase
setopt complete_in_word
# When completing from the middle of a word, move the cursor to the end of the word
setopt always_to_end
# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt autocd
# Make cd push the old directory onto the directory stack.
setopt auto_pushd
# Allow comments even in interactive shells
setopt interactive_comments
# Report the status of background jobs immediately, rather than waiting until just before printing a prompt
setopt notify
# List jobs in the long format
setopt long_list_jobs
# Don't kill background jobs on logout
setopt nohup
# Allow functions to have local options
setopt local_options
# Allow functions to have local traps
setopt local_traps
# Required for alias completion: m c<TAB>
setopt complete_aliases

#
# ENV
#
export TERM=xterm-256color
export TMPDIR="/tmp"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
eval "$(dircolors -b ~/.dircolors)"
# Less options
export LESS="--ignore-case --RAW-CONTROL-CHARS --LONG-PROMPT --hilite-unread --tabs=2"
# Enable using less on archive (eg. `less foo.zip`)
eval $(lesspipe)
# Use bat to color manpage
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Print dates in ISO format (in `ls -l` for example)
export TIME_STYLE="long-iso"
# Ripgrep config
export RIPGREP_CONFIG_PATH="/home/tom/.ripgreprc"
# SSH ask-pass. Require pkg ssh-askpass
export SSH_ASKPASS="/usr/bin/ssh-askpass"
# Allows to kill backward word path by path using ctrl+w
# With this, ctrl+w on '/usr/bin' will produce '/usr'. Without it, '/usr/bin' is removed.
# Default is: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
# Python REPL initialization
export PYTHONSTARTUP="$HOME/.pythonstartup"
# Node 22/23... cache
# The recommendation is to set to a tmp directory to avoid the cache growing too much. But I will see.
# See: https://nodejs.org/api/module.html#module-compile-cache
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache

#
# ZSH Modules config
#

# Force refresh the terminal title before each command.
autoload add-zsh-hook
update_terminal_title() {
  print -Pn "\e]0;%~ - Terminal\a"
}
add-zsh-hook precmd update_terminal_title

# Edit command line by pressing Ctrl+x Ctrl+e
autoload -U edit-command-line
zle -N edit-command-line
bindkey "\C-x\C-e" edit-command-line

# Awesome MV
# Example: zmv '(**/)file.xml' '$1anotherName.xml'
autoload zmv
