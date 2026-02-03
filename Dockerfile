FROM ghcr.io/catthehacker/ubuntu:act-latest

# Install dependencies (perl, wget, etc.)
RUN sudo apt-get update && \
    sudo apt-get install -y perl wget xz-utils

# Install Vanilla TeX Live
RUN cd /tmp && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    zcat < install-tl-unx.tar.gz | tar xf - && \
    cd install-tl-2* && \
    sudo perl ./install-tl --no-interaction && \
    cd /tmp && \
    rm -rf install-tl-2* install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2025/bin/x86_64-linux:${PATH}"
