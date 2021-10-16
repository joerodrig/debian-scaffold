#!/bin/bash
# Run as dev user ("su dev")

cd ~/
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

# Redis
sudo apt-get install redis-server -y

# Memcached
sudo apt-get install memcached libmemcached-tools -y

# Chruby
echo "Installing Chruby"
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ~/

# ruby-install - https://github.com/postmodern/ruby-install
wget -O ruby-install-0.8.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.3.tar.gz
tar -xzvf ruby-install-0.8.3.tar.gz
cd ruby-install-0.8.3/
sudo make install
cd ~/
rm -rf ruby-install-*

# Pyenv - https://github.com/pyenv/pyenv-installer
echo "Installing Pyenv"
curl https://pyenv.run | bash

# NvM - https://github.com/nvm-sh/nvm
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Github CLI - https://github.com/cli/cli/blob/trunk/docs/install_linux.md
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

printf "****---------------------***"
printf "Make sure to add the following to your .bashrc:\n"
printf "source /usr/local/share/chruby/chruby.sh\n"
printf "source /usr/local/share/chruby/auto.sh\n"
printf "export PATH=\"$HOME/.pyenv/bin:$PATH\"\n"
printf "eval \"$(pyenv init --path)\"\n"
printf "eval \"$(pyenv virtualenv-init -)\"\n"
printf "eval \"$(pyenv virtualenv-init -)\"\n"
printf "****---------------------***"
rm -rf chruby-*

exec $SHELL
