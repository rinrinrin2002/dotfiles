#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Miscellaneous"

: "Wallpaper and workflows" && () {
  ln -nfv "${DOTFILES}/wallpaper.png" "${HOME}/Pictures/wallpaper.png"

  rsync -a --delete "${DOTFILES}/workflows" "${DOTFILES}/tmp"
  for f in ${DOTFILES}/tmp/workflows/*; do
    open -W ${f}
  done
}

echo

: "Install Node.js" && () {
  source "/opt/homebrew/opt/nvm/nvm.sh"
  nvm install node
}
