# OMZ Plugins
plugins=(
  docker
  git
  github
  golang
  sublime
  z
)

# Load OMZ
ZSH_THEME=rodaine
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

load_list=(
  downloads # clean up downloads
  help      # use better man help pages
  setopts   # set zsh options
  functions # load custom functions
  aliases   # load custom aliases
  homebrew  # load homebrew-specific info
  work      # load work-related custom configs
)
for file in $load_list; do
  local target="$ZDOTDIR/$file.zsh"
  if [[ -f $target ]]; then
    source $target
  fi
done
