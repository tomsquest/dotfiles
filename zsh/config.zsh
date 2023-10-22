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
# Required for alias completion: m c<TAB>
setopt complete_aliases

#
# ENV
#
eval "$(dircolors -b ~/.dircolors)"
export TMPDIR='/tmp'
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'
export LESS='--ignore-case --RAW-CONTROL-CHARS --LONG-PROMPT --hilite-unread --tabs=2'
eval $(lesspipe)
# Colors for less binary.
# Src: https://unix.stackexchange.com/questions/119/colors-in-man-pages/147#147
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export TERM=xterm-256color
# Print dates in ISO format (in `ls -l` for example)
export TIME_STYLE=long-iso
# Ripgrep config
export RIPGREP_CONFIG_PATH=/home/tom/.ripgreprc
# SSH ask-pass. Require pkg ssh-askpass
export SSH_ASKPASS=/usr/bin/ssh-askpass
# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# Additional MANPATH
export MANPATH="$MANPATH:$HOME/.local/man"
# Allows to kill backward word path by path using ctrl+w
# With this, ctrl+w on '/usr/bin' will produce '/usr'. Without it, '/usr/bin' is removed.
# Default is: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# Python REPL initialization
export PYTHONSTARTUP="$HOME/.pythonstartup"

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

# Load completions
# Should be done by Zgen, but it does not seem to run it
autoload -Uz compinit && compinit

# Create directory and move into
mcd() { [ -n "$1" ] && mkdir -p "$1" && cd "$1" }

# Delete old docker containers
docker-clean() {
  local MAX_AGE="90d"
  echo "Deleting containers, images and volumes older than $MAX_AGE"
  docker run -ti \
    -v /var/run/docker.sock:/var/run/docker.sock \
    yelp/docker-custodian \
    dcgc \
      --max-image-age "$MAX_AGE" \
      --max-container-age "$MAX_AGE" \
      --dangling-volumes
}
