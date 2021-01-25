#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Install software from the Brewfile"

brew doctor && brew bundle --global
