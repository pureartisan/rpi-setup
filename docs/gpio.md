### GPIO (General Purpose Input Output)

Raspbian already comes with the python libraries for GPIO.

However, if you want to test, you can install the `wiringpi` package to control the pins via command line
```
sudo apt-get install wiringpi
```

e.g.:
```
# control GPIO pin 18

gpio -g mode 18 pwm
gpio -g pwm 18 0
gpio -g pwm 18 1023
