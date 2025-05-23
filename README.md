[aguslr/docker-xen-orchestra][1]
================================

[![docker-pulls](https://img.shields.io/docker/pulls/aguslr/xen-orchestra)](https://hub.docker.com/r/aguslr/xen-orchestra) [![image-size](https://img.shields.io/docker/image-size/aguslr/xen-orchestra/latest)](https://hub.docker.com/r/aguslr/xen-orchestra)


This *Docker* image sets up *Xen Orchestra* inside a docker container.

> **[Xen Orchestra][2]** is designed to give you the tools you need to
> administrate your XCP-ng (or Citrix Hypervisor/XenServer) pools and enjoy a
> complete overview of your whole VMs infrastructure.


Installation
------------

To use *docker-xen-orchestra*, follow these steps:

1. Clone and start the container:

       docker run -p 8080:80 \
         -v "${PWD}"/data:/var/lib/xo-server docker.io/aguslr/xen-orchestra:latest

2. Configure your Web browser to connect to your *Xen Orchestra* server's IP
   address on port `8080`.


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-xen-orchestra.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-xen-orchestra && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-xen-orchestra
[2]: https://docs.xen-orchestra.com/installation#from-the-sources
