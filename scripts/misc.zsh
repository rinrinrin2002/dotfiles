#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Miscellaneous"

: "Hard link to the wallpaper" && () {
  ln -nfv "${DOTFILES}/wallpaper.png" "${HOME}/Pictures/wallpaper.png"
}

echo

: "Install Node.js" && () {
  source "/opt/homebrew/opt/nvm/nvm.sh"
  nvm install node
}
