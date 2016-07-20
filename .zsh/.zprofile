# Load Go Version
source $HOME/.gimme/envs/latest.env &>/dev/null

# Load Rust Version
source $HOME/.cargo/env

# Setup Path
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=$GOPATH/bin:$PATH
export PATH

# Setup Man Path
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
export MANPATH
