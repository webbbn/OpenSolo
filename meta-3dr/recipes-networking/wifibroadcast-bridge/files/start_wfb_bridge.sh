#!/bin/sh
ip link set wlan0 down
iw dev wlan0 set type monitor
ip link set wlan0 up
iw wlan0 set txpower fixed 3000
iw dev wlan0 set freq 2452
iw wlan0 set bitrates legacy-2.4 11
wfb_bridge /etc/default/wfb_bridge air wlan0:ar9271
