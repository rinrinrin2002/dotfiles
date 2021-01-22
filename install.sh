#!/bin/bash

cd `dirname $0`

for file in .??*; do
  [ "$file" == ".DS_Store" ] && continue
  [ "$file" == ".git" ] && continue
  
  ln -snfv "$PWD/$file" "$HOME/$file"
done

if [ "$1" = "init" ]; then
  if ! type brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if type brew &>/dev/null; then
    brew doctor && brew bundle
  fi

  if type gh &>/dev/null; then
    gh repo clone OpenCore-B75-Pro3-M "$HOME/OpenCore-B75-Pro3-M"
    gh auth login && \
      gh repo clone proprietary-software "$HOME/proprietary-software"
  fi
fi