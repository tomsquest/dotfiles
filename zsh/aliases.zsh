alias szshrc='source ~/.zshrc'
alias grep='grep --color=auto'
alias ack='ack-grep'
alias du='du -h'
alias df='df -h'
alias f='find -iname'
alias v='vim'
alias install='sudo apt-get install'

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
alias ls='ls                                  --classify --group-directories-first --color=auto'
alias  l='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias ll='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable --classify --group-directories-first --color=auto'

# More verbose fileutils
alias cp='nocorrect cp -iv'
alias rm='nocorrect rm -Iv' # -i to prompt for every file
alias mv='nocorrect mv -iv'
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

# Parent directories
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias  g='git'
alias gs='git status'
alias gp='git pull --rebase'
alias gl='git log --oneline'

# Maven
alias    m='mvn'
alias  mpt='alert printAndRun mvn package -DskipTests'
alias mcpt='alert printAndRun mvn clean package -DskipTests'
alias  mit='alert printAndRun mvn install -DskipTests'
alias mcit='alert printAndRun mvn clean install -DskipTests'
alias   mi='alert printAndRun mvn clean install -Pintegration-tests'
alias   mj='printAndRun mvn jetty:run'

