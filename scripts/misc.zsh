#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

printf "\n\n\033[32m%s\033[m\n" "> Miscellaneous"

: "Sign in to GitHub" && () {
  gh auth login
}

: "Install Node.js" && () {
  source "/opt/homebrew/opt/nvm/nvm.sh"
  nvm install node
}

echo

: "Hard link to the wallpaper" && () {
  ln -nfv "${DOTFILES}/wallpaper.png" "${HOME}/Pictures/wallpaper.png"
}
