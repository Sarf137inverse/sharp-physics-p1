#!/usr/bin/env bash
# Run from: src/   (i.e., bash build.sh)
# Output:   src/build/main.pdf
# Logs:     src/build/main.log

set -e
set -o pipefail

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Creating the build directory structure
mkdir -p build
mkdir -p build/manuscripts/{ch01-measurement,ch02-vector,ch03-dynamics,ch04-mechanics,ch05-energy,ch06-gravitation,ch07-matter,ch08-periodic-motion,ch09-waves,ch10-ideal-gas}

# --- First Pass ---
echo "[build] Running LuaLaTeX (pass 1)..."

set +e  # Temporarily allow commands to fail without crashing the script
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex 2>&1 | grep -E "^(! |l\.|Error|Warning|Overfull|Underfull|LaTeX Warning)"
LUALATEX_EXIT=${PIPESTATUS[0]}
set -e  # Re-enable exit-on-error immediately

if [ "$LUALATEX_EXIT" -ne 0 ]; then
  echo "[build] LuaLaTeX pass 1 failed with exit code $LUALATEX_EXIT. Full log: build/main.log"
  exit 1
fi


# --- Second Pass (for cross-references, TOC, etc.) ---
echo "[build] Running LuaLaTeX (pass 2)..."

set +e  # Temporarily allow commands to fail
lualatex \
  --interaction=nonstopmode \
  --output-directory=build \
  main.tex 2>&1 | grep -E "^(! |l\.|Error|Warning|Overfull|Underfull|LaTeX Warning)"
LUALATEX_EXIT=${PIPESTATUS[0]}
set -e  # Re-enable exit-on-error immediately

if [ "$LUALATEX_EXIT" -ne 0 ]; then
  echo "[build] LuaLaTeX pass 2 failed with exit code $LUALATEX_EXIT. Full log: build/main.log"
  exit 1
fi


# --- Final Verification ---
PDF_SIZE=$(stat -f%z build/main.pdf 2>/dev/null || stat -c%s build/main.pdf 2>/dev/null || echo 0)
if [ "$PDF_SIZE" -lt 1000 ]; then
  echo "[build] PDF file too small ($PDF_SIZE bytes). Build likely failed. Full log: build/main.log"
  exit 1
fi

echo "[build] Done. Output: src/build/main.pdf"
