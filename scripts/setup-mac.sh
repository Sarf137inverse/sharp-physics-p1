#!/usr/bin/env bash
set -e

echo "[setup] Installing TeX Live for Sharp Physics..."

if ! command -v brew &>/dev/null; then
    echo "[setup] Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask mactex-no-gui

echo "[setup] Refreshing PATH..."
eval "$(/usr/libexec/path_helper)"

echo "[setup] Done. Run 'bash src/build.sh' to compile."