#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Configure Git"

: "Import GPG key" && () {
  keybase --standalone login
  keybase --standalone pgp export | gpg --import
  keybase --standalone pgp export -s | gpg --import
  echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > "${HOME}/.gnupg/gpg-agent.conf"
  gpgconf --kill gpg-agent
}

echo

: "Sign in to GitHub" && () {
  gh auth login
}
