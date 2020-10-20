# OMZ Plugins
plugins=(
  docker
  git
  github
  golang
	kubectl
  z
)

# Load OMZ
ZSH_THEME=rodaine
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

load_list=(
  paths     # path adjustments
  downloads # clean up downloads
  help      # use better man help pages
  setopts   # set zsh options
  golang    # Go specific configuration
  rust      # Rust specific configuration
  ruby      # Ruby specific configuration
  vim       # vim specific configuration
  functions # load custom functions
  aliases   # load custom aliases
  homebrew  # load homebrew-specific info
	k8s       # kubernetes configuration
  work      # load work-related custom configs
)
for file in $load_list; do
  local target="$ZDOTDIR/$file.zsh"
  if [[ -f $target ]]; then
    source $target
  fi
done
