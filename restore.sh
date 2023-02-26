#!/bin/bash

declare -r DEVICE="$(hostname)"

if [ -z "$DEVICE" ]; then
  echo "Device is required."
  exit 1;
fi

echo "Device: $DEVICE"

cp -R $DEVICE/dotconfig/. ~/.config
cp -R $DEVICE/dotfiles/. ~/