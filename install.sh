#!/usr/bin/env bash

shopt -s extglob
set -o errtrace
set -o errexit

if [ `uname` = "Linux" ]; then
  sudo apt-get install -y rake git-core
fi
cd ~ && git clone git://github.com/sebastiangeiger/new-dotfiles.git dotfiles
cd ~/dotfiles && rake install
