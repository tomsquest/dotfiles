#
# History
#
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# Share history betwen multiple termional sessions
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
# Completion correction : 'sl' instead of 'ls'
#setopt correctall
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


#
# ENV
#
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'
export GREP_OPTIONS='--color=auto'
export LESS='--ignore-case --RAW-CONTROL-CHARS --LONG-PROMPT --no-init --quit-if-one-screen --hilite-unread'
export PAGER=less
export TERM=xterm-256color
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export M2_HOME=$HOME/Apps/maven/current
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin

# Allows to kill backward word path by path using ctrl+w
# With this, ctrl+w on '/usr/bin' will produce '/usr'. Without it, '/usr/bin' is removed.
# Default is: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

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
bindkey '\C-x\C-e' edit-command-line

# Awesome MV
# Example: zmv '(**/)file.xml' '$1anotherName.xml'
autoload zmv

# Load rupa Z: quickly jump to recent directory with the z command
# Example: z foo
# See: https://github.com/rupa/z
source ~/.zsh/rupa-z/z.sh
