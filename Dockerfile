FROM ubuntu:14.04

MAINTAINER erroneousboat <jpbruinsslot@gmail.com>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y neovim \
                       git \
                       python-dev \
                       python-pip \
                       ctags

RUN pip install --user neovim

ENV NVIM_TUI_ENABLE_TRUE_COLOR 1

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "nvim" ]
