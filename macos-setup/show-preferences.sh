#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is intended for macOS." >&2
  exit 1
fi

show_preference() {
  local key=$1
  local label=$2
  local value
  local description
  shift 2

  if ! value=$(LC_ALL=C defaults "$@" read -g "$key" 2>&1); then
    case "$value" in
      "Error: Could not find key '$key' in domain "*|*"The domain/default pair of "*" does not exist")
        value='(unset)'
        ;;
      *)
        printf '%s: %s\n' "$key" "$value" >&2
        return 1
        ;;
    esac
  fi

  case "$key:$value" in
    ApplePressAndHoldEnabled:0) description='Repeat the character' ;;
    ApplePressAndHoldEnabled:1) description='Show the accent menu for supported letters' ;;
    AppleFontSmoothing:0) description='Off' ;;
    AppleFontSmoothing:1) description='Light' ;;
    AppleFontSmoothing:2) description='Medium' ;;
    AppleFontSmoothing:3) description='Strong' ;;
    *:'(unset)') description='(unset)' ;;
    *) description="Unknown value ($value)" ;;
  esac

  printf '%s: %s\n' "$label" "$description"
}

show_preference ApplePressAndHoldEnabled 'When you hold a key'
show_preference AppleFontSmoothing 'Font smoothing on this Mac' -currentHost
