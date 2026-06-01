#!/usr/bin/env bash
set -e

echo "[setup] Installing TeX Live for Sharp Physics..."

sudo apt-get update
sudo apt-get install -y \
    texlive-luatex \
    texlive-lang-other \
    texlive-science \
    texlive-pictures \
    texlive-latex-extra

echo "[setup] Done. Run 'bash src/build.sh' to compile."