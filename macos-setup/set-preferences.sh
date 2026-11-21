#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is intended for macOS." >&2
  exit 1
fi

# Use key repeat when a key is held down.
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable font smoothing for this user on this Mac.
defaults -currentHost write -g AppleFontSmoothing -int 0
