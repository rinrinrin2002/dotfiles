#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Set up the environment"

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts

echo

gh auth login
