#!/bin/bash

DEVICE=$(hostname)

echo "Device: $DEVICE"

xargs -a "$DEVICE/Packages.aur" yay -S --noconfirm --needed
