# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Use saner defaults
if [ -f ~/.bash-sensible/sensible.bash ]; then
   source ~/.bash-sensible/sensible.bash
fi

# Prompt
PS1='\[\033[01;32m\]\D{%T}\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;37m\]\$\[\033[00m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Colors
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Aliases
alias ls='ls                                  --classify --group-directories-first --color=auto'
alias  l='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias ll='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable --classify --group-directories-first --color=auto'
alias  grep='grep --color=auto'
alias egrep='grep --color=auto'
alias zgrep='grep --color=auto'
alias du='du -h'
alias df='df -h'
alias   g='git'
alias  gs='git status'
alias  gl='git l'
alias  gp='git pull'
alias gaa='git add -A'
alias    m='mvn'
alias   mc='mvn clean'
alias   mt='mvn test'
alias  mct='mvn clean test'
alias  mcp='mvn clean package'
alias mcpt='mvn clean package -Dmaven.test.skip=true'
alias  mpt='mvn package -Dmaven.test.skip=true'
alias  mci='mvn clean install'
alias mcit='mvn clean install -Dmaven.test.skip=true'
alias  mdt="mvn dependency:tree"
