alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias f='find -iname'
alias v='vim'
alias meteo='curl http://wttr.in/Lille'
alias up='sudo apt update && sudo apt -V --yes upgrade'
alias ydl="youtube-dl --format best --output '%(upload_date)s.%(title)s.%(ext)s' --restrict-filenames --write-description"

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
# -v: natural sort of version
alias ls='exa       --group-directories-first --color=auto --git --icons'
alias  l='exa -l    --group-directories-first --color=auto --git --icons'
alias ll='exa -l    --group-directories-first --color=auto --git --icons'
alias la='exa -l -a --group-directories-first --color=auto --git --icons'

# grep
alias  grep='grep --color=auto'
alias egrep='grep --color=auto'
alias zgrep='grep --color=auto'

# More verbose fileutils
alias cp='nocorrect cp -iv' # -i to prompt for every file
alias mv='nocorrect mv -iv'
alias rm='nocorrect rm -Iv' # -I to prompt when more than 3 files
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

# Parent directories
alias cd..='cd ..'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias      g='git'
compdef    g=git
alias     gs='git status'
alias     gl='git log --graph --abbrev-commit --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias     gp='git pull; git log -n 1 | grep -q -c "\-\-wip\-\-" && echo "\033[0;33mWARNING: Last commit is a WIP\!\033[0m"'
alias    gaa='git add -A'
alias    gcm='git rev-parse --abbrev-ref origin/HEAD | cut -c8- | xargs -n 1 git checkout' # checkout master/main/develop automatically
alias     gc='git checkout -'
alias    gpf='git push --force-with-lease'
alias   gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias  gwipp='gwip && git push --force-with-lease'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# shellcheck disable=SC2142
alias delete-merged-branches="git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"

# NPM
alias  ns='printAndRun npm start'
alias nsd='printAndRun npm run start:dev'
alias nsh='printAndRun npm run start:hmr'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'

# Scala SBT
alias st='printAndRun sbt ~test-quick'

# Docker compose
alias   dup='alert printAndRun docker-compose up -d'
alias ddown='alert printAndRun docker-compose down -t 5'
alias   dsa='alert printAndRun docker-compose start'
alias   dso='alert printAndRun docker-compose stop'
alias    dl='docker-compose logs'
alias   dlf='docker-compose logs -f'

# Tools
alias cat=bat
alias cd=z
