FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-luatex \
    texlive-lang-other \
    texlive-science \
    texlive-pictures \
    texlive-latex-extra \
    latexmk \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace