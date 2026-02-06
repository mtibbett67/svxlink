# SvxLink

These are the scripts I've created to assist with instaling and configuring svxlink.

---

### Hardware list:
- Raspberry Pi. Version 3 or newer (https://www.raspberrypi.com/)
- USB Sound Card (https://www.amazon.com/gp/product/B00IRVQ0F8)
- Baofeng Audio Patch Cable (https://www.amazon.com/gp/product/B01LMIBAZW)
- Y-cord to connect a single 3.5mm to USB Sound Card Mic and Audio out (https://www.amazon.com/dp/B073ZDDTH2)

### Installation:
Install OS, Raspberry Pi OS Lite is recommended if you feel you need to conserve resources.

Install Git via apt install git or app store


Port and protocols needed for an EchoLink node:

- EchoLink requires that inbound UDP ports 5198 and 5199 to your node are passed through. 

- Also, TCP port 22 for Secure Shell to the node will allow you to log into the device remotely to manage it.

---
## Sites I used to get my information from for this build

- Original Project Site
-- https://www.svxlink.org/

- Installation on a Raspberry Pi and link thru a Baofeng
-- https://www.vnutz.com/articles/echolink_on_a_raspberry_pi_with_a_baofeng_uv5r

- Echolink node on Raspberry Pi using SVXLink
-- http://np2wj.com/echolink-node-on-raspberry-pi-using-svxlink-part-1/

- Installing SVXLink On Raspberry Pi OS Bullseye
-- https://ccc.myrac.ca/VE6PLC_installing_svxlink.pdf

- Wiring diagram to DIY a Baofeng to sound card harness
-- https://schematron.org/image/baofeng-headset-wiring-diagram-3.png

- EchoLink site
-- https://echolink.org/

---
TODO:

- (Done) Hardware list

- Installation instructions

- List important configuration files

- Look into All Star link version 3

- (Done) Site refernces to sites I use
