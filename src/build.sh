#!/usr/bin/env bash
# build.sh — primitive build script for Sharp-Physics-1st-Paper. vibe coded using claude
# Run from: src/   (i.e., bash build.sh)
# Output:   src/build/main.pdf
# Logs:     src/build/main.log

set -e

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

mkdir -p build

echo "[build] Running LuaLaTeX (pass 1)..."
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex

# Second pass for cross-references, TOC, etc.
echo "[build] Running LuaLaTeX (pass 2)..."
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex

echo "[build] Done. Output: src/build/main.pdf"

# vibe coded by sarf using claude.  
