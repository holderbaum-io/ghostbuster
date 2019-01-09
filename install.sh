#!/bin/bash

set -eu

info() {
  printf "\033[0;32m%s\033[0m\n" "$1"
}

info 'Installing Ghostbuster'
