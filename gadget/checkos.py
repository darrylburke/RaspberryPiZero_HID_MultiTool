#!/usr/bin/python
import RPi.GPIO as GPIO
import time
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
#GPIO.setup(19, GPIO.OUT, initial=GPIO.HIGH)
GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(27, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_UP)
if GPIO.input(18) == GPIO.LOW:
        print ("windows")
if GPIO.input(27) == GPIO.LOW:
        print ("ios")
if GPIO.input(23) == GPIO.LOW:
        print ("linux")
GPIO.cleanup() 
