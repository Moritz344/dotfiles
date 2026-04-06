#!/bin/bash
# Muss ausgeführt werden damit wheel erkannt wird:
sudo usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01 
#sudo modprobe hid-logitech
#sudo modprobe hid-logitech-new
#sudo modprobe lg4ff

