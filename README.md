# Setting up a development VM with SSH using Tailscale

# Why?
Inspired by the eternal struggle of trying to do software development on an M1 mac in 2021.

This setup allows you to keep your development environment running on a Debian server in a VM, while you develop on your host machine. The host can either be the machine you're running the VM on, or a remote machine that you can ssh into using tailscale. 

The main benefits of this approach are that you don't need to run heavy servers on the same machine your developing on, so if your primary dev machine is constrained by RAM or CPU, offloading that to a separate machine can help speed up development.

## Prerequisites:
- [VirtualBox VM](https://www.virtualbox.org/wiki/Downloads)
- A [Debian base image]((https://www.debian.org/distrib/netinst)) for your architecture
- [Tailscale](https://tailscale.com/download)

## Steps
1. Add the Debian ISO to a new VirtualBox machine. I specified 4vCPU, 8GB Ram, and 16GB fixed-size SSD
2. Start VM and run through the installation steps
3. Install base packages: `bash ./install-base.sh`
4. Install additional utilities for development: `bash ./install-utils.sh`
5. Adding personal information(NOTE: Maintain a snapshot that doesn't contain this information if you intend on sharing the setup)
  - [Set up Github ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
  - [Set up Github gpg key](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-new-gpg-key-to-your-github-account)
  - Authenticate VM and Host machine to Tailscale
6. Add the IP from your VM to your ssh config
```shell
# File: ~/.ssh/config
Host dev-server
HostName <TAILSCALE IP>
User <USER>
```
7. Install the Remote Explorer(Microsft) extension in VSCode on host machine
8. ssh into the VM using the hostname added to your ssh config.

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

