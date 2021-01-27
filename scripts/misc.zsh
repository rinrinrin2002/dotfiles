#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

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
  export NVM_DIR="${HOME}/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
  nvm install --lts
}

echo

: "Configure GnuPG and import PGP keys" && () {
  echo "pinentry-program /usr/local/bin/pinentry-mac" > "${HOME}/.gnupg/gpg-agent.conf"
  gpg-connect-agent reloadagent /bye

  keybase login
  keybase pgp export | gpg --import
  keybase pgp export -s | gpg --import
}

echo

: "Login to GitHub" && () {
  gh auth login
}
