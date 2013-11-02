#! /bin/sh
# Inspired by docker-plex https://github.com/aostanin/docker-plex
rm -rf /var/run/*

mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

avahi-daemon -D
sleep 1

/etc/init.d/netatalk start
sleep 3

# afpd / netatalk should be logged here
tail -f /var/log/dmesg
