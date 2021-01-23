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
    printf '\e[32m\n\n%s\n\n\e[m' '> Install Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor && brew bundle --global
  fi

  if type gh &>/dev/null; then
    printf '\e[32m\n\n%s\n\n\e[m' '> Download Proprietary Software'
    gh auth login && \
      gh repo clone rinrinrin2002/dotfiles-private && \
        /bin/zsh dotfiles-private/download.zsh

    printf '\e[32m\n\n%s\n\n\e[m' '> Download OpenCore'
    gh repo clone rinrinrin2002/OpenCore-B75-Pro3-M && {
        printf '\e[32m\n\n%s\n\n\e[m' '> Install OpenCore'
        diskutil list internal physical
        printf '\e[33m%s\e[m' 'Which device do you want to install OpenCore on(ex. "disk0")? '
        read device
        sudo diskutil mount /dev/"$device"s1 && {
            rm -rf /Volumes/EFI/*
            cp -Rv OpenCore-B75-Pro3-M/EFI /Volumes/EFI
            cp -Rv OpenCore-B75-Pro3-M/Utilities /Volumes/EFI
          }
        diskutil unmount /dev/"$device"s1
      }
  fi
fi