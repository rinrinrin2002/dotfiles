#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

printf "\n\n\033[32m%s\033[m\n" "> Create symlinks"

for f in ${DOTFILES}/.??*; do
  filename=$(basename ${f})

  [[ ${filename} == .DS_Store ]] && continue
  [[ ${filename} == .git ]] && continue
  
  ln -snfv "${DOTFILES}/${filename}" "${HOME}/${filename}"
done
