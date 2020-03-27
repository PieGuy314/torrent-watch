#!/bin/sh

usage()
{
    echo "Usage sudo ./$(basename $0)"
}

[ "$(id -u)" -ne 0 ] && usage && exit 1

mkdir -p /opt/torrent-watch/bin /opt/torrent-watch/lib/systemd/system

cat torrent-watch > /opt/torrent-watch/bin/torrent-watch
cat torrent-watch.service > /opt/torrent-watch/lib/systemd/system/torrent-watch.service

chmod a+x /opt/torrent-watch/bin/torrent-watch

systemctl enable /opt/torrent-watch/lib/systemd/system/torrent-watch.service
systemctl start torrent-watch.service
