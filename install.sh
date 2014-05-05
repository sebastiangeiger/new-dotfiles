#!/usr/bin/env bash

shopt -s extglob
set -o errtrace
set -o errexit

if [ `uname` = "Linux" ]; then
  sudo apt-get install -y rake git-core
fi
rake install
