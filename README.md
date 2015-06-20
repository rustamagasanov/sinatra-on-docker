# Sinatra On Docker

Vagrant + Docker + Sinatra example. Uses [Ubuntu 14.04 vagrant box](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) and [passenger-ruby22](https://registry.hub.docker.com/u/phusion/passenger-ruby22/) as a base image.

## Requirements

Virtual box and Vagrant installed.

## Usage

```bash
# Vagrant box installation and log in:
vagrant up
vagrant ssh

# Docker installation(pretty simple for Ubuntu 14.04 box):
wget -qO- https://get.docker.com/ | sh

# Become a root
sudo su

# To check if docker installation was successful:
# docker run hello-world 

# Build a new image tagged sinatra-test with Dockerfile instructions:
cd /vagrant
docker build -t=sinatra-test .

```
