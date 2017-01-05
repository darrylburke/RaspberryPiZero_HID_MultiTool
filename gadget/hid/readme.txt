Duckberry Pi
Author: Jeff L. (Renegade_R - renegade_r65@hotmail.com)
Version 0.5

Credits to Original Authors:
DroidDucky by Andrej Budincevic (https://github.com/anbud/DroidDucky)
hardpass by girst (https://github.com/girst/hardpass)

DuckBerry Pi is a Raspberry Pi distro based on Minibian which allows the Raspberry Pi Zero to behave similar to a USB Rubber Ducky: a small device USB device which emulates a keyboard and automates key entry.  Ducky scripts (uncompiled) which are made for the USB Rubber Ducky can be used with the Duckyberry Pi without modification.  This can be useful for automating computer tasks, penetration testing machines, playing pranks, or just fun (by default plugging in an untouched Duckberry Pi image will open a Youtube video).  Since it is recognized as a standard keyboard, this tool is compatible with Windows, Mac OS, Linux, Android, PlayStation 4, and anything that supports a USB keyboard.  Credits go all to the original authors, I merely ported the code to the Raspberry Pi and filled in a few gaps that were missing between Android and Raspbian.

How to Create this Manually:

1) Flash the latest Raspbian Jessie image to an SD card

2) Update the kernel of the Raspberry Pi which has USB Gadget support.  We are updating specifically to 4.4.0 because the driver is only compatible with it:

BRANCH=next rpi-update c053625

3) Copy all the files (hid-gadget-test.c, duckpi.sh, usleep.c, g_hid.ko) to /home/pi

4) Compile the hid-gadget-test program, this handles moving the text to the Human Interface Device driver:

gcc hid-gadget-test.c -o hid-gadget-test

5) Compile usleep, this is a basic function which is not natively supported in Raspbian and is used to account for delays in the program:

make usleep

6) Ensure all files and scripts are executable (chmod 755 <file>)

7) Copy the driver into the kernel drivers directory:

cp g_hid.ko /lib/modules/4.4.0+/kernel/drivers/usb/gadget/legacy

8) Activate the dwc2 drivers which allows the device to function in host mode when not connected to a PC:

echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt

9) Place the dwc2 in the driver modules to boot with the OS:

echo "dwc2" | sudo tee /etc/modules

10) Place the Gadget HID (Human Interface Device) driver module to boot with the OS:
echo "g_hid" | sudo tee -a /etc/modules

11) Copy the following into your /etc/rc.local file.  This allows you to place a "payload.dd" script in the "boot" drive that appears when you plug the SD card into a computer, it will then copy the file and format it for Unix (because Windows machines format the text differently):

sleep 3
cat /boot/payload.dd > /home/pi/payload.dd
sleep 1
tr -d '\r' < /home/pi/payload.dd > /home/pi/payload2.dd
sleep 1
/home/pi/duckpi.sh /home/pi/payload2.dd

12) Copy the actual payload into /boot, this directory can also be accessed in Windows by simply placing your micro SD card into a card reader and copying it to the drive that appears.  Here are two sample payloads, save it as a text file with the file name "payload.dd".

Open Youtube Video

GUI r
DELAY 50
STRING www.youtube.com/watch?v=dQw4w9WgXcQ
ENTER
DELAY 1000
F11

Minimize to Desktop, Take Screenshot, Hide Icons, Use Screenshot as Wallpaper

GUI d
DELAY 500
PRINTSCREEN
DELAY 100
MENU
DELAY 300
STRING V
DELAY 300
STRING D
DELAY 300
GUI r
DELAY 700
STRING mspaint
ENTER
DELAY 1200
CTRL v
DELAY 500
CTRL s
DELAY 1000
STRING %userprofile%\a.bmp
ENTER
DELAY 500
ALT f
DELAY 400
STRING K
DELAY 100
STRING F
DELAY 1000
ALT F4
DELAY 300
GUI d

13) Place SD card into the Raspberry Pi Zero, plug it into the target host machine via USB cable in the peripheral micro USB port, NOT THE POWER PORT.  A power cord is not required as the Pi Zero will take power directly from the host machine.

14) Watch the script execute on the host machine

Note: You may have to insert it two times: the first time is due to the driver installation

Resources:
Premade Ducky Scripts: https://github.com/hak5darren/USB-Rubber-Ducky/wiki
Original USB Rubber Ducky: http://usbrubberducky.com/#!index.md