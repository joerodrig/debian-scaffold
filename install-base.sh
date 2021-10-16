#!/bin/bash

# Install base packages
su - 
apt-get install sudo
usermod -aG sudo dev

# Base packages
su dev
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