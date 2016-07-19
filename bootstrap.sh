#!/usr/bin/env bash
# Creates symlinks and moves files into place as needed to setup the system

DOTS=$(dirname "$(readlink -f "$0")")

ln -s $DOTS/zsh/.zshenv $HOME/.zshenv
ln -s $DOTS/zsh/.zshrc $HOME/.zshrc
