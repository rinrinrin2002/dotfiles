#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

: "Sign in to the App Store" && () {
  printf "\033[33m%s\033[m" "Press Enter to sign in to the App Store first."
  read
  open -a "/System/Applications/App Store.app"
  printf "\n\033[33m%s\033[m" "Press Enter to continue..."
  read
}

: "Install Homebrew" && () {
  printf "\n\n\033[32m%s\033[m\n" "> Install Homebrew"
  if type brew &>/dev/null; then
    printf "\033[33m%s\033[m\n" "Homebrew is already installed."
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

: "Clone the repo from GitHub" && () {
  printf "\n\n\033[32m%s\033[m\n" "> github.com/rinrinrin4046/dotfiles -> ~/.dotfiles"
  git clone https://github.com/rinrinrin4046/dotfiles ${DOTFILES}
}

/bin/zsh "${DOTFILES}/scripts/symlink.zsh"
/bin/zsh "${DOTFILES}/scripts/bundle.zsh"
/bin/zsh "${DOTFILES}/scripts/git.zsh"
/bin/zsh "${DOTFILES}/scripts/misc.zsh"
/bin/zsh "${DOTFILES}/scripts/opencore.zsh"

printf "\n\n\033[32m%s\033[m\n" "Done!"
