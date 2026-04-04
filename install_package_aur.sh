#!/bin/bash

set -euo pipefail

DEVICE=$(hostname)
AUR_PACKAGE_FILE="$DEVICE/Packages.aur"

if [[ ! -f /etc/os-release ]]; then
  echo "Could not detect operating system: /etc/os-release is missing"
  exit 1
fi

. /etc/os-release

echo "Device: $DEVICE"
echo "OS: ${ID:-unknown}"

case "${ID:-}" in
  arch)
    if [[ ! -f "$AUR_PACKAGE_FILE" ]]; then
      echo "AUR package list not found: $AUR_PACKAGE_FILE"
      exit 1
    fi

    xargs -a "$AUR_PACKAGE_FILE" yay -S --noconfirm --needed
    ;;
  ubuntu)
    echo "Skipping AUR installation on Ubuntu"
    ;;
  *)
    echo "Unsupported distribution: ${ID:-unknown}"
    exit 1
    ;;
esac
