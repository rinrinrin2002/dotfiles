#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

: "Install Homebrew" && () {
  printf "\033[32m%s\033[m\n" "> Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

: "Clone the repo from GitHub" && () {
  printf "\n\n\033[32m%s\033[m\n" "> github.com/rinrinrin4046/dotfiles -> ~/.dotfiles"
  git clone https://github.com/rinrinrin4046/dotfiles ${DOTFILES}
}

zsh "${DOTFILES}/scripts/symlink.zsh"
zsh "${DOTFILES}/scripts/bundle.zsh"
zsh "${DOTFILES}/scripts/git.zsh"
zsh "${DOTFILES}/scripts/misc.zsh"

printf "\n\n\033[32m%s\033[m\n" "Done!"
