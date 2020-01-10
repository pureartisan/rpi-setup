# Setting up Adafruit TFT screen

### Getting started
```
cd ~
wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/adafruit-pitft.sh
chmod +x adafruit-pitft.sh
sudo ./adafruit-pitft.sh
```

### PiTFT Selection

* Select between 1-4 for teh correct type of screen
* Select rotation (this can be changed later by re-running this script)

### Configuring what shows where

#### PiTFT as Text Console (best for Raspbian 'Lite')
This is the simplest to set-up type of use. Its great if you have a simple text based or pygame/SDL based interface. If you want the PiTFT to act as a text console you can expect:

* HDMI will be 'deactivated' - nothing appears on the HDMI output but a black screen
* The login prompt appears on the Pi
* The Pi is all text, not a GUI (no PIXEL desktop)
* Keyboard and mouse are used only by the PiTFT interface
* Framebuffer-capable software (such as fbi for displaying images, mplayer for videos, or pygame software, etc) appear on the PiTFT
* OpenGL accelerated software will not appear on the PiTFT (it is unaccelerated * framebuffer only)
* But, non-OpenGL-accelerated graphics software is a bit faster than using HDMI mirroring (not tons faster but you're not running fbcp which will always make it faster)

If you want that say `Yes` to the question `Would you like the console to appear on the PiTFT display`

Then simply reboot. Once rebooted you will not see anything on HDMI, but the console will appear on the PiTFT. That's it!

#### PiTFT as HDMI Mirror (Best for Raspbian Full/PIXEL)

This option is the easiest to understand: whatever appears on the HDMI display will be 'mirrored' to the PiTFT. Note that HDMI is much higher resolution so it's not like it turns the PiTFT into a 1080p display. This is great for when you want to run OpenGL-optimized software, PIXEL desktop software, or really anything. The down-side is its a little slower than drawing directly to the framebuffer. You may not notice it but it's worth us mentioning!

* HDMI will be 'activated' but at a lower resolution - you can change this later but it looks best at 320x240 (PiTFT 2.2", 2.4", 2.8" and 3.2") or 480x320 (PiTFT 3.5")
* The login prompt or GUI appears on both HDMI and PiTFT at the same time
* Keyboard and mouse are shared, since the display is mirrored
* All graphics appear on both HDMI and PiTFT, thanks to fbcp

If you want that say `Yes` to the question `Would you like the HDMI display to mirror to the PiTFT display?`

#### PiTFT as Raw Framebuffer Device

For advanced users who are comfortable using framebuffer devices, it is possible to have the PiTFT and HDMI graphics be both active and display different data.

* HDMI will be active and act like a normal Pi
* The login prompt or GUI (PIXEL) appears on the HDMI
* PiTFT appears black, nothing appears on it
* Keyboard and mouse are used by the HDMI interface but can, in theory, be captured and used to change graphics on PiTFT through programming
* Framebuffer-capable software (such as fbi for displaying images, mplayer for videos, or pygame software, etc) can appear on the PiTFT if you set it up to display to /dev/fb1
* OpenGL accelerated software will never appear on the PiTFT (it is unaccelerated framebuffer only)

If you want that, say No to both of the configuration questions!