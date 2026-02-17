alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias f='find -iname'
alias v='vim'
alias up='sudo apt update && sudo apt -V --yes upgrade'

# History with timestamps and elapsed time
alias h='history -iD'

# ls/eza
alias  l='eza --long --group-directories-first --icons --hyperlink'
alias la='eza --long --group-directories-first --icons --hyperlink --all'

# grep
alias  grep='grep  --color=auto'
alias egrep='egrep --color=auto'
alias zgrep='zgrep --color=auto'

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
alias     gp='git pull; git log -n 1 | grep -q -c "\-\-wip\-\-" && echo "\033[0;33m⚠️WARNING: Last commit is a WIP\!\033[0m" || true'
alias    gaa='git add -A'
alias    gcm='git rev-parse --abbrev-ref origin/HEAD | cut -c8- | xargs -n 1 git checkout' # checkout master/main/develop automatically
alias     gc='git checkout -'
alias    gco='git checkout'
alias    gcb='git checkout -b'
alias    gci='git commit'
alias  gciam='git commit -am'
alias    gbr='git branch'
alias   gbra='git branch -a'
alias  gdiff='git diff --word-diff=color'
alias    gpf='git push --force-with-lease'
alias   gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias  gwipp='gwip && git push --force-with-lease'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# shellcheck disable=SC2142
alias delete-merged-branches="git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"

# NPM
alias  ns='printAndRun npm start'
alias nsd='printAndRun npm run start:dev'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'

# Docker compose
alias   dup='printAndRun docker compose up -d'
alias ddown='printAndRun docker compose down -t 5'
alias   dsa='printAndRun docker compose start'
alias   dso='printAndRun docker compose stop'
alias    dl='docker compose logs'
alias   dlf='docker compose logs -f'

# Just
alias j='just'
alias ja='just all'
alias js='just serve'
alias jt='just test'

# Tools
alias cat="bat --paging=never"
