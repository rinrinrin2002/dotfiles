#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Install software"

: "Sign in to the App Store" && () {
  printf "\033[33m%s\033[m" "Press Enter to sign in to the App Store."
  read
  open -a "/System/Applications/App Store.app"
  printf "\n\033[33m%s\033[m" "Press Enter to continue..."
  read
}

echo

: "Install software" && () {
  sudo softwareupdate --install-rosetta
  brew doctor
  brew bundle --global
}
