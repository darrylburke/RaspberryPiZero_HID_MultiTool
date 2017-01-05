#!/usr/bin/python
import RPi.GPIO as GPIO
import time
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(19, GPIO.OUT, initial=GPIO.HIGH)
GPIO.setup(12, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(13, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(16, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(26, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
if GPIO.input(13) == GPIO.HIGH:
        print ("serial")
elif GPIO.input(16) == GPIO.HIGH:
        print ("ethernet")
elif GPIO.input(26) == GPIO.HIGH:
        print ("hid")
elif GPIO.input(12) == GPIO.HIGH:
        print ("storage")
else:
 	print ("normal")
#time.sleep(60)
GPIO.cleanup() 
