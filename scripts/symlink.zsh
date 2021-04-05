#!/bin/zsh

DOTFILES="${HOME}/.dotfiles"

printf "\n\n\033[32m%s\033[m\n" "> Create symbolic links"

for f in ${DOTFILES}/.??*; do
  filename="$(basename ${f})"
  case "${filename}" in
    ".DS_Store" ) continue ;;
    ".git" ) continue ;;
    ".gitignore" ) continue ;;
    * ) ln -snfv "${DOTFILES}/${filename}" "${HOME}/${filename}" ;;
  esac
done
