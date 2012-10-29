alias szshrc='source ~/.zshrc'
alias grep='grep --color=auto --line-number --ignore-case'
alias ack='ack-grep'
alias du='du -h'
alias df='df -h'
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'
alias f='find -iname'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
alias ls='ls                                  --classify --group-directories-first --color=auto'
alias  l='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias ll='ls -l              --human-readable --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable --classify --group-directories-first --color=auto'

# More verbose fileutils
alias cp='nocorrect cp -iv'
alias rm='nocorrect rm -iv'
alias mv='nocorrect mv -iv'
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

# ..
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Rails
alias rc='echo Opening Rails console...; if [ -f script/console ]; then script/console; else script/rails console; fi'
alias rs='echo Launching Rails server...; if [ -f script/server ]; then script/server; else script/rails server; fi'
alias rdm='alert printAndRun rake db:migrate && annotate'
alias rdr='alert printAndRun rake db:migrate:redo && annotate'
alias rseed='alert printAndRun rake db:seed'

# Git
alias  g='git'
alias gs='git status'

# Maven
alias    m='mvn'
alias  mpt='alert printAndRun mvn package -DskipTests'
alias mcpt='alert printAndRun mvn clean package -DskipTests'
alias  mit='alert printAndRun mvn install -DskipTests'
alias mcit='alert printAndRun mvn clean install -DskipTests'
alias   mi='alert printAndRun mvn clean install -Pintegration-tests'
alias  mjr='mvn jetty:run'

