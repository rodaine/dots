# .zshenv' is sourced on all invocations of the shell, unless the -f option is
# set. It should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.
# ---

# Path adjustments
path+=(/usr/local/bin)

# While waiting for autocomplete, show dots
export COMPLETION_WAITING_DOTS="true"

# XDG Spec - http://standards.freedesktop.org/basedir-spec/latest/
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Location of these dotfiles
export DOTS=$XDG_CONFIG_HOME/dots

# All further ZSH loading should come from $DOTS
export ZDOTDIR=$DOTS/zsh

# Editors
export EDITOR=vim
export VISUAL=vim

# File type colors on `ls` command
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Z - https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z
export _Z_DATA=$XDG_DATA_HOME/z/.z

# Golang
export GIMME_SILENT_ENV=1
source $HOME/.gimme/envs/latest.env
export GLIDE_HOME=$XDG_CONFIG_HOME/glide
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH

# Load Rust Version
source $HOME/.cargo/env

# History
export HISTFILE=$XDG_DATA_HOME/.history
export SAVEHIST=10000
export HISTSIZE=10000

# VIM
export MYVIMRC=$DOTS/vim/.vimrc
export VIMINIT='source $MYVIMRC'
