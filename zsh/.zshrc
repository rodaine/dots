#------------------------------------------------------------------------------
# ZSH CONFIG
#------------------------------------------------------------------------------

# DOTS
export DOTZ=$HOME/.dots

# Oh-My-Zsh Root
export ZSH=$HOME/.oh-my-zsh

# Theme: ~/.oh-my-zsh/themes/
export ZSH_THEME="rodaine"

# Completion Dumps
export ZDOTDIR=$DOTZ/.zcompdumps

# Make Sublime the default editor
# -w makes the command wait until the file is closed
export EDITOR=vim
export VISUAL=vim

# Set the colors for file types on ls command
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# While waiting for autocomplete, show dots
COMPLETION_WAITING_DOTS="true"

# Plugins: ~/.oh-my-zsh/plugins/
plugins=(git brew osx git-flow github node npm gem git-extras sublime golang bundler docker)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/help

#------------------------------------------------------------------------------
# TWEAKS
#------------------------------------------------------------------------------

# General
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt RM_STAR_WAIT # wait 10s before deletes
setopt ZLE
setopt NO_FLOW_CONTROL # disables ctrl-s
setopt NO_CLOBBER
setopt NO_BEEP

# History
HISTFILE=$DOTZ/.history
SAVEHIST=10000
HISTSIZE=10000

setopt APPEND_HISTORY # don't overwrite history; append instead
setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Performance
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $DOTZ/.zshcache

# Cleanup
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

#------------------------------------------------------------------------------
# PATHS
#------------------------------------------------------------------------------

# Z
export _Z_DATA=$HOME/.dots/.z
. `brew --prefix`/etc/profile.d/z.sh

# GoLang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
source $HOME/.gimme/envs/latest.env &>/dev/null

# Node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use --silent 0.10.40

# GNU
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH # GNU Core Utils

# Standard Paths
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/lib:$PATH
export PATH=/usr/X11/bin:$PATH

export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"     # PHP
export PATH=/usr/local/mysql/bin:$PATH                          # MySQL
export PATH=/usr/local/lib/mongodb/bin:$PATH                    # MongoDB
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH     # GNU Core Utils
export PATH=/Applications/ADT/sdk/platform-tools:${PATH}        # ANDROID SDK
export PATH=/Applications/ADT/sdk/tools:${PATH}                 # ANDROID SDK
export PATH=/usr/local/heroku/bin:$PATH                         # HEROKU
export PATH=$PATH:$HOME/.rvm/bin                                # RVM
export PATH=$PATH:$GOBIN                                        # GO

#------------------------------------------------------------------------------
# DOCKER
#------------------------------------------------------------------------------

#eval "$(docker-machine env default)"
#export DOCKER_IP=$(docker-machine ip default)

#------------------------------------------------------------------------------
# RUST
#------------------------------------------------------------------------------

source $HOME/.cargo/env

#------------------------------------------------------------------------------
# RUBY
#------------------------------------------------------------------------------

eval "$(rbenv init -)"

#------------------------------------------------------------------------------
# ALIASES
#------------------------------------------------------------------------------

# YOLO
alias yolo="sudo !!"

# Navigation
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias docs="cd ~/Documents"
alias db="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Documents/Projects"

# open
alias o="open"

# Shell History
alias h="history"

# zsh
alias zsh_config="subl $HOME/.zshrc"
alias zsh_theme="subl $ZSH/themes/$ZSH_THEME.zsh-theme"
alias zsh_themes="subl $ZSH/themes"
alias zsh_plugins="subl $ZSH/plugins"
alias ohmyzsh="subl $ZSH"

# ls

function cls {
 ls -lah --color --group-directories-first "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'
}
alias l="cls"
alias ll="cls"
alias la="cls"

alias v="vagrant "

# sudo
alias sudo="sudo "

# curl
alias gurl="curl --compressed"

# Updater
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; sudo brew cleanup; sudo npm update npm -g; sudo npm update -g; sudo gem update'

# IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Hosts
alias hosts="sudo subl /etc/hosts"

# DNS Flush
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# grep
alias grep="grep --color=auto"

# ping
alias ping="ping -c 5"

# Sublime Text
alias sub="stt"
alias s="stt"

# Terminal
alias c="clear"
alias cl="clear"

# Empty Trash
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# SERVER
alias serv="php -S localhost:1337"

# CURL
alias curly='curl -w "@$DOTZ/.curl_format" -o /dev/null -s -v'

# COMPOSER
alias composer='/usr/local/bin/composer.phar'

# PROCESS FINDER
alias pz='ps -aef | grep '

# EXIT
alias x='exit'

# LOCK SCREEN WHEN AFK
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# ALIAS VI TO VIM
alias vi=vim

# GIT
alias gf="git fetch --prune --tags"
alias gpsu="git name-rev --name-only HEAD | xargs git push --set-upstream origin $1"
alias gz="gcm && gl && gbda"
alias gbd="gb -D"

# GORE
alias gore="gore --autoimport"

#------------------------------------------------------------------------------
# VSCO - RELATED
#------------------------------------------------------------------------------

# OPS CODE
export OPSCODE_USER=rodaine

source $HOME/vsco/vagrant/script/profile &>/dev/null

# VAGRANT
export VAGRANT_CWD=~/vsco/vagrant
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export VSCO_VAGRANT_BOX="vsco-mango"

alias vup='vagrant up $VSCO_VAGRANT_BOX'
alias vu='vup'
alias vs='vagrant ssh $VSCO_VAGRANT_BOX'
alias vh='vagrant halt $VSCO_VAGRANT_BOX'

function finalurl {
  curl $1 -s -L -I -o /dev/null -w '%{url_effective}'
}

# added by travis gem
[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh

#------------------------------------------------------------------------------
# DASH
#------------------------------------------------------------------------------

function dash {
  open dash://$1:$2
}

function pullsync {
  pre='echo "var user = db.gridsite.findOne({domain:\"'
  post='\"}).user.id; db.syncmedia.find({user_id:user, status:1}).forEach(function(d){ print(\"aws s3 cp s3://vscosync-prod-ore/\" + d.storage_location + d.file_name + \" \"+d._id.valueOf()+\".jpg\")})" | mongo vsco_1'

  cmd=$pre$1$post
  ssh prod-ore-sync-api2.prod-ore.vsco.plumbing $pre$1$post | zsh
}

alias vd="vsco-cli -o vsco -e dev"
alias vs="vsco-cli -o vsco -e preprod"
alias vp="vsco-cli -o vsco -e prod"

alias ad="vsco-cli -o au -e dev"
alias as="vsco-cli -o au -e preprod"
alias ap="vsco-cli -o au -e prod"
