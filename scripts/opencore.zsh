#!/bin/zsh

OPENCORE="${HOME}/.opencore"

printf "\n\n\033[33m%s\033[m" "Do you want to install OpenCore? (y/N): "
read install

if [[ ${(L)install:-n} == y ]]; then
  printf "\n\033[32m%s\033[m\n" "> Install OpenCore"
  git clone https://github.com/rinrinrin2002/OpenCore-B75-Pro3-M ${OPENCORE}
  echo
  diskutil list internal physical
  printf "\033[33m%s\033[m" "Device name (ex. \"disk0\"): "
  read device

  sudo diskutil mount "/dev/${device}s1" && {
    rsync -av --delete --exclude ".*" --exclude shellx64.efi "${OPENCORE}/" /Volumes/EFI
    diskutil unmount "/dev/${device}s1"
  }
fi
