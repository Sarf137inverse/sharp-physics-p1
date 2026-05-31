FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y --no-install-recommends locales \
    && locale-gen en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR /workspace