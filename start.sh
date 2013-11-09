#! /bin/sh
# Inspired by docker-plex https://github.com/aostanin/docker-plex
# Rerun at startup

# Time Machine user
adduser --disabled-password --gecos "" tmuser
echo "tmuser:tmpass"|chpasswd

# Time Machine storage. You need to mount a Volume in /TimeCapsule
#mkdir /TimeCapsule
chown tmuser:tmuser /TimeCapsule

# dbus setup
rm -rf /var/run/*

mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

# Avahi (to broadcast the tm service in the LAN)
avahi-daemon -D
sleep 1

/etc/init.d/netatalk start
#afpd
sleep 3

touch /var/log/netatalk.log
tail -f /var/log/netatalk.log
