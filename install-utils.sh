#!/bin/bash

cd ~
# Postgresql https://www.postgresql.org/download/linux/debian/
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql


# Tailscale - https://tailscale.com/download/linux/debian-bullseye
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale -y

# Docker - https://docs.docker.com/engine/install/debian/
sudo apt-get update
 curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Chruby
echo "Installing Chruby"
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ~/

# Pyenv - https://github.com/pyenv/pyenv-installer
echo "Installing Pyenv"
curl https://pyenv.run | bash

# NvM - https://github.com/nvm-sh/nvm
echo "installing "
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

exec $SHELL

echo "Make sure to add the following to your .bashrc:"
echo "source /usr/local/share/chruby/chruby.sh"
echo "source /usr/local/share/chruby/auto.sh"