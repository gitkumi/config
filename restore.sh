#!/bin/bash

while getopts "d:" arg; do
  case $arg in
    d) declare -r DEVICE=$OPTARG;;
  esac
done

if [ -z "$DEVICE" ]; then
  echo "Device is required."
  exit 1;
fi

cp -R $DEVICE/dotconfig/. ~/.config
cp -R $DEVICE/dotfiles/. ~/