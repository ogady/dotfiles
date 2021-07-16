##############
# alias
##############
alias ls='exa'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -Ga'
alias ll='ls -lGa'

## docker alias
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dc='docker-compose'
alias drm='docker system prune -a --volumes'

## git alias
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

## ghq alias
alias gcd='cd $(ghq root)/$(ghq list | peco)'

## intellij
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'