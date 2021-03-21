#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Install software"

brew doctor
sudo softwareupdate --install-rosetta
brew bundle --global
