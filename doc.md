# Setting up a development VM with SSH using Tailscale

# Why?
Inspired by the eternal struggle of trying to do web development on an M1 mac in 2021


Prerequisites:
- Install VirtualBox VM
- Download a Debian base image for your architecture(https://www.debian.org/distrib/netinst)


1. Add the Debian ISO to a new VirtualBox machine. I specified 4vCPU, 8GB Ram, and 16GB fixed-size SSD
2. Start VM and run through the installation steps
3. Install base packages: `bash ./install-base.sh`
4. Install additional utilities for development: `bash ./install-utils.sh`

Installs: 
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

