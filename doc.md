Setting up a development VM with SSH using Tailscale

Prerequisites:
- Install VirtualBox VM
- Download a Debian base image for your architecture(https://www.debian.org/distrib/netinst)


1. Add the Debian ISO to a new VirtualBox machine. I specified 4vCPU, 8GB Ram, and 16GB fixed-size SSD
2. Start VM and run through the installation steps
3. Install base packages: `bash ./install-base.sh`
4. Install additional utilities for development: `bash ./install-utils.sh`

Installs: 
- Ruby 3.0.2 
- Postgresql 13
- Python 3.7
- Node 14.8.1
- Tailscale
  -> sudo tailscale up
  -> tailscale ip -4

- Openssh server
- Redis
- Memcached
- Git

