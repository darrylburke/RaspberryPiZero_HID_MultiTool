# RaspberryPiZero_HID_MultiTool
Scripts for turning a RaspBerryPi zero into multiple HID devices including, Serial, Ethernet, Storage, HID Keyboard

Note:  This project is a compliation of several sources of scripts / config files I found for each of the various HID devices you can turn the Zero Pi into..   I put them in a single system and tied them into the pin configurations to automatically switch the zPI.

##GENERAL



I used a USB UART board to connect to the zPi uart pins in case there were any issues with the boot or not being able to switch to serial/ethernet mode to get access to the OS on the zPI.

##Pin Modes

I used the GPIO Pins to allow the zPI to be configured on what *function* it should run, and was *OS* to pass to the scripts to customize how it operates.

The following pins are used

## Zero Pi Function

| Function |  Pins |
|----------|-------|
|Serial Console| GPIO 19 & GPIO 13|
|Ethernet | GPIO 19 & GPIO 16|
|HID Keyboard| GPIO 19 & GPIO 26|
|USB Storage| GPIO6 & GPIO 12|
|-----------|-------|
