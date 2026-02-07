# SvxLink

These are the scripts I've created to assist with instaling and configuring svxlink.

---
### Hardware list:
- Raspberry Pi. Version 3 or newer [here](https://www.raspberrypi.com/)
- USB Sound Card [here](https://www.amazon.com/gp/product/B00IRVQ0F8)
- Baofeng Audio Patch Cable [here](https://www.amazon.com/gp/product/B01LMIBAZW)
- Y-cord to connect a single 3.5mm to USB Sound Card Mic and Audio out [here](https://www.amazon.com/dp/B073ZDDTH2)

### Installation Instructions:
Install OS, Raspberry Pi OS Lite is recommended if you feel you need to conserve resources.

Install Git via apt install git or app store

Git Clone this repository

`git clone https://github.com/mtibbett67/svxlink.git`

Set the shell scripts to executable:

`sudo chmod +x *.sh`

Run the install.sh script. This will install any depencies, make, and install the SvxLink pakage.

You will be prompted to run the configure.sh script next.  It will ask you for your Call Sign,
EchoLink password, Sysop name, Location, and Description 
 

Port and protocols needed for an EchoLink node:
In order to allow SvxLink to connect to the EchoLink servers you will need to open some ports
and let them thru to your SvxLink node. Also assign a static IP address or DHCP reservation for
your node.

- EchoLink requires inbound UDP ports 5198 and 5199 forwarded to your node are passed through` 

- Also, if you need to remotely manage your node you will want to forward TCP port 22 for
Secure Shell to the node.

---
## Sites I used to get my information from for this build

- Original Project Site [here](https://www.svxlink.org/)

- Installation on a Raspberry Pi and link thru a Baofeng [here](https://www.vnutz.com/articles/echolink_on_a_raspberry_pi_with_a_baofeng_uv5rP)

- Echolink node on Raspberry Pi using SVXLink [here](http://np2wj.com/echolink-node-on-raspberry-pi-using-svxlink-part-1/)

- Installing SVXLink On Raspberry Pi OS Bullseye [here](https://ccc.myrac.ca/VE6PLC_installing_svxlink.pdf)

- Wiring diagram to DIY a Baofeng to sound card harness [here](https://schematron.org/image/baofeng-headset-wiring-diagram-3.png)

- EchoLink site [here](https://echolink.org/)

---
TODO:

- (Done) Hardware list

- Installation instructions

- List important configuration files

- Look into All Star link version 3

- (Done) Site refernces to sites I use
