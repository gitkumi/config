#!/bin/bash

set -euo pipefail

DEVICE=$(hostname)
PACKAGE_FILE="$DEVICE/Packages"

if [[ ! -f /etc/os-release ]]; then
  echo "Could not detect operating system: /etc/os-release is missing"
  exit 1
fi

. /etc/os-release

echo "Device: $DEVICE"
echo "OS: ${ID:-unknown}"

if [[ ! -f "$PACKAGE_FILE" ]]; then
  echo "Package list not found: $PACKAGE_FILE"
  exit 1
fi

case "${ID:-}" in
  arch)
    xargs -a "$PACKAGE_FILE" pacman -S --noconfirm --needed
    ;;
  ubuntu)
    sudo apt-get update
    xargs -a "$PACKAGE_FILE" sudo apt-get install -y
    ;;
  *)
    echo "Unsupported distribution: ${ID:-unknown}"
    exit 1
    ;;
esac
