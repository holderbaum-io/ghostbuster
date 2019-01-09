#!/bin/bash

set -eu

info() {
  printf "\033[0;32m%s\033[0m\n" "$1"
}

error() {
  printf "\033[0;31m%s\033[0m\n" "$1"
}

target=/usr/local/bin/ghostbuster

if [ -e "$target" ];
then
  if [ "$(tail -n1 "$target")" = '# LAST LINE TO DETECT PREVIOUS GHOSTBUSTER' ];
  then
    info 'Updating Ghostbuster'
  else
    error "Can't install Ghostbuster, somthing with this is name is already installed"
    exit 1
  fi
else
  info 'Installing Ghostbuster'
fi


ghostbuster="$(mktemp)"
url='https://raw.githubusercontent.com/hrx-events/ghostbuster/master/ghostbuster'
curl -sSl "$url" >"$ghostbuster"
sudo mv "$ghostbuster" "$target"
sudo chmod +x "$target"
