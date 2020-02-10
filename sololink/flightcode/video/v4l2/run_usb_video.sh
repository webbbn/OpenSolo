#!/bin/sh

while 1; do
    v4l2_to_udp - 2560 1280 10.1.1.153 5600
    sleep 10
done
