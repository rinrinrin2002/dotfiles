#!/bin/zsh

printf "\n\n\033[32m%s\033[m\n" "> Create symlinks"

for f in ${DOTFILES}/.??*; do
  filename=$(basename ${f})

  [[ ${filename} == .DS_Store ]] && continue
  [[ ${filename} == .git ]] && continue
  [[ ${filename} == .gitignore ]] && continue

  ln -snfv "${DOTFILES}/${filename}" "${HOME}/${filename}"
done
