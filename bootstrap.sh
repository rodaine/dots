#!/usr/bin/env zsh
# Creates symlinks and moves files into place as needed to setup the system

DOTS=$(dirname $0:A)

# Ensure logins are quiet
touch $HOME/.hushlogin

# Link ZSH Env
[[ ! -f $HOME/.zshenv ]] \
  && [[ -f $DOTS/.zsh/.zshenv ]] \
  && ln -s $DOTS/.zsh/.zshenv $HOME/.zshenv

# Git configuration (using XDG spec)
git_config_dir=$HOME/.config/git
mkdir -p $git_config_dir
for file in $DOTS/git/*; do
  target=$git_config_dir/$(basename $file)
  [[ ! -f $target ]] && ln -s $file $target
done
