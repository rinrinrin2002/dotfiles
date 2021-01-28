#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Configure Git"

keybase login
keybase pgp export | gpg --import
keybase pgp export -s | gpg --import

echo "pinentry-program /usr/local/bin/pinentry-mac" > "${HOME}/.gnupg/gpg-agent.conf"
gpgconf --kill gpg-agent

echo

gh auth login
