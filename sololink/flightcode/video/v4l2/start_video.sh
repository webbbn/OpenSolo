#!/bin/sh

while true; do

  # First try to launch gstreamer on the port(s) to see if there's anything on the HDMI port
  gst-launch mfw_v4lsrc device=/dev/video0 ! video/x-raw-yuv,width=1920,height=1080 ! mfw_ipucsc ! video/x-raw-yuv,width=1920,height=1080 ! vpuenc codec=6 gopsize=5 framerate-nu=30 force-framerate=1 seqheader-method=3 bitrate=6000000 ! rtph264pay config-interval=1 pt=96 ! udpsink host=192.168.1.30 port=5600

  # Next try to find a USB camera
  v4l2_to_udp - 2560 1280 192.168.1.30 5600

  # If they all fail, try again after a few seconds
  sleep 10

done
