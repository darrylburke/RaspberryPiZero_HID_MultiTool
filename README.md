# RaspberryPiZero_HID_MultiTool
Scripts for turning a RaspBerryPi zero into multiple HID devices including, Serial, Ethernet, Storage, HID Keyboard

Note:  This project is a compliation of several sources of scripts / config files I found for each of the various HID devices you can turn the Zero Pi into..   I put them in a single system and tied them into the pin configurations to automatically switch the zPI.

##GENERAL



I used a USB UART board to connect to the zPi uart pins in case there were any issues with the boot or not being able to switch to serial/ethernet mode to get access to the OS on the zPI.

##Pin Modes

I used the GPIO Pins to allow the zPI to be configured on what *function* it should run, and was *OS* to pass to the scripts to customize how it operates.

The following pins are used

## Reboot the Zero Pi
| Function |  Pins |
|----------|-------|
|Shutdown| GND (Pin 39) & GPIO 21|

## Zero Pi Function

| Function |  Pins |
|----------|-------|
|Serial Console| GPIO 19 & GPIO 13|
|Ethernet | GPIO 19 & GPIO 16|
|HID Keyboard| GPIO 19 & GPIO 26|
|USB Storage| GPIO6 & GPIO 12|

## Zero Pi OS identification

| Function |  Pins |
|----------|-------|
|Windows| GND (Pin 14)  & GPIO 18|
|iOS | GND (Pin 14)  & GPIO 27|
|Linux| GND (Pin 14)  & GPIO 23|

## Install Instructions

1. Copy the gadget directory to /root/gadget
2. install the 2 rc files via the install.sh script in the gadget/rc directory
3. set the pins and away you go

# Mode Specific Notes

## Ethernet

  when setup as an ethernet device, the zPI will have the IP address of 192.16.2.2
  *in progress is the setup of a DHCP server on the PI to assign an IP to the device attached*
  
  install the isc dhcp server on the PI and use the following config 
  /etc/dhcp/dhcpd.conf
```
subnet 192.168.2.0 netmask 255.255.255.0 {
  range 192.168.2.10 192.168.2.20;
}
```
/etc/default/isc-dhcp-server
```
DHCPD_CONF=/etc/dhcp/dhcpd.conf
DHCPD_PID=/var/run/dhcpd.pid
INTERFACES="usb0"
```
  
  
## HID Keyboard.
   create and copy your duckberrypi script and place it /boot/payload.dd
   note the start script for hid has a way to customize/automate the copy. check hid/start.sh
   *Note in progress, get it to use the script which can be placed in the storage bin file *
   
##
  
