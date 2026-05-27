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
mkdir -p build/manuscripts/ch01-measurement
mkdir -p build/manuscripts/ch02-vector
mkdir -p build/manuscripts/ch03-dynamics
mkdir -p build/manuscripts/ch04-mechanics
mkdir -p build/manuscripts/ch05-energy
mkdir -p build/manuscripts/ch06-gravitation
mkdir -p build/manuscripts/ch07-matter
mkdir -p build/manuscripts/ch08-periodic-motion
mkdir -p build/manuscripts/ch09-waves
mkdir -p build/manuscripts/ch10-ideal-gas


echo "[build] Running LuaLaTeX (pass 1)..."
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex 2>&1 | grep -E "^(! |l\.|Error|Warning|Overfull|Underfull|LaTeX Warning)"

# Second pass for cross-references, TOC, etc.
echo "[build] Running LuaLaTeX (pass 2)..."
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex

echo "[build] Done. Output: src/build/main.pdf"

# vibe coded by sarf using claude.  
