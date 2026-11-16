#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is intended for macOS." >&2
  exit 1
fi

command -v curl >/dev/null 2>&1 || {
  echo "curl is required to download the installers." >&2
  exit 1
}

echo "Installing rustup and the default Rust toolchain..."
# https://rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing Codex CLI..."
# https://learn.chatgpt.com/docs/codex/cli
curl -fsSL https://chatgpt.com/codex/install.sh | sh

echo "Installing Claude Code..."
# https://code.claude.com/docs/en/setup
curl -fsSL https://claude.ai/install.sh | bash

echo "Installing uv..."
# https://docs.astral.sh/uv/getting-started/installation/
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "CLI installation complete. Open a new terminal to pick up PATH changes."
echo "Run codex and claude to complete sign-in."
