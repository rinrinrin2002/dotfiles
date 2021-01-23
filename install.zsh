#!/bin/zsh

DOTFILES=$(cd $(dirname "$0"); pwd)

for file in "$DOTFILES"/.??*; do
  filename=$(basename "$file")

  [[ $filename == .DS_Store ]] && continue
  [[ $filename == .git ]] && continue
  
  ln -snfv "$DOTFILES/$filename" "$HOME/$filename"
done

if [[ $1 == init ]]; then
  if ! type brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if type brew &>/dev/null; then
    brew doctor && brew bundle --global
  fi

  if type gh &>/dev/null; then
    gh repo clone rinrinrin2002/OpenCore-B75-Pro3-M
    gh auth login && \
      gh repo clone rinrinrin2002/dotfiles-private && \
        /bin/zsh dotfiles-private/download.zsh
  fi
fi