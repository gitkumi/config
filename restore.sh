#!/bin/bash

DEVICE=$(hostname)

echo "Device: $DEVICE"

cp -R "$DEVICE/dotconfig/." ~/.config
cp -R "$DEVICE/dotfiles/." ~/
