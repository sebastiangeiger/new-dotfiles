#!/usr/bin/sh
if [ `uname` = "Linux" ]; then
  apt-get install -y rake
fi
rake install
