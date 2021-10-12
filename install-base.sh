#!/bin/bash

# Install base packages
su - 
apt-get install sudo
  -> usermod -aG sudo dev
- Base packages
  -> sudo apt-get install make \
  git \
  build-essential \ 
  libssl-dev \ 
  zlib1g-dev \
  libbz2-dev \ 
  libreadline-dev \
  libsqlite3-dev \ 
  wget \ 
  curl \ 
  llvm \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  redis-server \
  memcached \
  libmemcached-tools \ 
  neovim