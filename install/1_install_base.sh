#!/bin/bash

# Base packages(run as dev user "su dev")
sudo apt-get install apt-transport-https \ 
  build-essential \ 
  ca-certificates \
  cmake \
  curl \
  git \
  gnupg \
  libbz2-dev \ 
  libffi-dev \
  liblzma-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \ 
  libssl-dev \ 
  libncursesw5-dev \
  libxml2-dev \
  libxmlsec1-dev \
  llvm \
  lsb-release \
  make \
  neovim \
  tk-dev \
  unzip \
  wget \ 
  xz-utils \
  zlib1g-dev 

# Virtualbox additions
sudo apt-get install -y dkms \
  linux-headers-$(uname -r) \
  module-assistant