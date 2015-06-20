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

# Now you should see sinatra-test in images list:
# docker images

# Start a container from sinatra-test image(-P=Publish all exposed ports to random ports, -d=Run container in background):
docker run -P -d sinatra-test

# Check ports mapping:
docker ps

# Check sinatra application is running(You should see "Hello world" message):
curl localhost:32769

# That's it!
```

## Other useful options

```bash
# Attach to a running container(sig-proxy set to false won't transfer signals to container, so you can detach with ctrl+c):
docker attach --sig-proxy=false *container_id or container_name*

# To enter a box:
docker run -it *image_name* /bin/bash

# Stop a box:
docker kill *container_id or container_name*
```

