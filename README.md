# docker-timemachine

## Description

An EXPERIMENTAL and BROKEN container to run avahi and netatalk(afpd) configured as a Time Capsule

## Usage

### Building

Build the image with `docker build -t my/tm .` in this directory.

### Running

# Example docker run command, mount your volume in the guest /TimeCapsule directory
```
docker run -n=false \
  -v /rpool/timemachine:/TimeCapsule \
  -lxc-conf="lxc.network.type = veth" \
  -lxc-conf="lxc.network.flags = up" \
  -lxc-conf="lxc.network.link = br0" \
  -lxc-conf="lxc.network.ipv4 = 192.168.1.11" \
  -lxc-conf="lxc.network.ipv4.gateway=192.168.1.1" \
my/tm
```

### Credits

- This tutorial http://ubuntuforums.org/showthread.php?t=2105755 (some configurations are already correct in Ubuntu 12.04)

- docker-plex https://github.com/aostanin/docker-plex 
