# Setting up a development VM with SSH using Tailscale

# Why?
Inspired by the eternal struggle of trying to do software development on an M1 mac in 2021.


## Prerequisites:
- Install VirtualBox VM
- Download a Debian base image for your architecture(https://www.debian.org/distrib/netinst)

## Steps
1. Add the Debian ISO to a new VirtualBox machine. I specified 4vCPU, 8GB Ram, and 16GB fixed-size SSD
2. Start VM and run through the installation steps
3. Install base packages: `bash ./install-base.sh`
4. Install additional utilities for development: `bash ./install-utils.sh`
5. Adding personal information(NOTE: Maintain a snapshot that doesn't contain this information if you intend on sharing the setup)
  - [Set up Github ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
  - [Set up Github gpg key](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-new-gpg-key-to-your-github-account)
  - Authenticate VM and Host machine to Tailscale
6. Install the Remote Explorer(Microsft) extension in VSCode
7. ssh into the VM using the private Tailscale IP(run `tailscale ip -4` in the VM to get it, or view it in the Tailscale dashboard).

## Installs: 
- Postgresql 13
  - Start: sudo systemctl start postgresql@13-main.service
  - Stop: sudo systemctl stop postgresql@13-main.service
  - Status: systemctl status postgresql@13-main.service
- Tailscale
  - Start: sudo tailscale up
  - View private ipv4 address: tailscale ip -4
- Openssh server
  - Start: sudo systemctl start ssh
  - Stop: sudo systemctl stop ssh
  - Status: systemctl status ssh
- Redis
  - Start: sudo systemctl start redis
  - Stop: sudo systemctl stop redis
  - Status: systemctl status redis
- Memcached
  - Start: sudo systemctl start memcached
  - Stop: sudo systemctl stop memcached
  - Status: systemctl status memcached
- Git

# Helpful info

- Sharing the image?
  - Clear your history: `history` then `history -d 1-[END]` and `history -w` then `clear` before snapshotting

