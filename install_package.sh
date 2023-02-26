#!/bin/bash

declare -r DEVICE="$(hostname)"

if [ -z "$DEVICE" ]; then
  echo "Device is required."
  exit 1;
fi

echo "Device: $DEVICE"

xargs -a $DEVICE/Packages pacman -S --noconfirm --needed