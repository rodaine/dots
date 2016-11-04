# Navigation
alias ....="cd ../../.."
alias .....="cd ../../../.."

# open
alias o="open"

# Shell History
alias h="history"

# ls
alias l="lsi"
alias la="lsi"

# grep
alias grep="grep --color=auto"

# ping
alias ping="ping -c 5"

# Terminal
alias c="clear"

# Bundler
alias be="bundle exec"
alias bi="bundle install"

# EXIT
alias x='exit'

# ALIAS VI TO VIM
alias oldvi=$(whence vi)
alias vi=vim

# GIT
alias gf="git fetch --prune --tags"
alias gpsu="git name-rev --name-only HEAD | xargs git push --set-upstream origin $1"
alias gz="git checkout master && git pull && gbda"
alias gbd="git branch -D"
alias gcp="git add --ignore-errors -A && git commit -m 'checkpoint'"

# GORE
alias gore="gore --autoimport"

# Intellij
alias ij="idea"
