#!/bin/bash

DEVICE=$(hostname)

echo "Device: $DEVICE"

xargs -a "$DEVICE/Packages" pacman -S --noconfirm --needed
