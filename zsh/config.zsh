#
# History
#
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
HISTORY_IGNORE="(ls|ls *|cd|cd *|pwd|exit)"
# Share history between multiple terminal sessions
# Also writes commands as they are typed (no need for inc_append_history/appendhistory, the zsh doc advises against combining them)
setopt share_history
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
# Allow aliases (eg. `g` for `git`) to be expanded before processing the command line for completion
# So that `g <TAB>` proposes git subcommands. Without this, only file completion is proposed.
unsetopt completealiases

#
# ENV
#
export EDITOR="nvim"
export VISUAL="nvim"
eval "$(dircolors -b)"
# Less options
export LESS="--ignore-case --RAW-CONTROL-CHARS --LONG-PROMPT --hilite-unread --tabs=2 --quit-if-one-screen"
# Enable using less on archive (eg. `less foo.zip`)
# Static output of `lesspipe`
export LESSOPEN="| /usr/bin/lesspipe %s"
export LESSCLOSE="/usr/bin/lesspipe %s %s"
# Use bat to color manpage
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Print dates in ISO format (in `ls -l` for example)
export TIME_STYLE="long-iso"
# Allows to kill backward word path by path using ctrl+w
# With this, ctrl+w on '/usr/bin' will produce '/usr'. Without it, '/usr/bin' is removed.
# Default is: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
# Node 22/23... cache
# The recommendation is to set to a tmp directory to avoid the cache growing too much. But I will see.
# See: https://nodejs.org/api/module.html#module-compile-cache
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache

#
# ZSH Modules config
#

# zsh-autosuggestions: suggest from history first, then from completions (eg. `git che` -> `git checkout`)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Edit command line by pressing Ctrl+x Ctrl+e
autoload -U edit-command-line
zle -N edit-command-line
bindkey "\C-x\C-e" edit-command-line

# Awesome MV
# Example: zmv '(**/)file.xml' '$1anotherName.xml'
autoload zmv
