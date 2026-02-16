# SvxLink

These are the scripts I've created to assist with installing and configuring svxlink.

---
### Hardware list:
- Raspberry Pi. Version 3 or newer [here](https://www.raspberrypi.com/)
- USB Sound Card [here](https://www.amazon.com/gp/product/B00IRVQ0F8)
- Baofeng Audio Patch Cable [here](https://www.amazon.com/gp/product/B01LMIBAZW)
- Y-cord to connect a single 3.5mm to USB Sound Card Mic and Audio out [here](https://www.amazon.com/dp/B073ZDDTH2)

### Installation Instructions:
Install OS, Raspberry Pi OS Lite is recommended if you feel you need to conserve resources.

Change to your home directory:

```
cd ~
```

Install Git via apt install git or app store:

```
sudo apt install git
```

Git Clone this repository:

```
git clone https://github.com/mtibbett67/svxlink.git
```

Move into the svxlink folder:

```
cd svxlink
```

Set the shell scripts to executable:

```
sudo chmod +x *.sh
```

Run the install.sh script as sudo.  This will install any dependencies, make, and install the SvxLink package.

```
sudo ./install.sh
```

Once the installation has completed you will be prompted to run the configure.sh script next.

```
sudo ./configure.sh
```

It will ask you for:

- Call sign (Your call sign or your clubs call sign)

- EchoLink password (Your current EchoLink password)

- Sysop name (The callsign of the person responsible for the node)

- Location (Usually your city and state)

- Description (What ever you want to describe your node as)

Once the configuration script has run it will state "Configuration complete"

Now restart SvxLink and check its status:

```
sudo systemctl restart svxlink && systemctl status svxlink | grep "Active: active (running)"
```

### Router / Network information:

In order to allow SvxLink to connect to the EchoLink servers you will need to open some ports
and let them thru to your SvxLink node. Also assign a static IP address or DHCP reservation for
your node.

Port and protocols needed for an EchoLink node:

- EchoLink requires inbound UDP ports 5198 and 5199 forwarded to your node are passed through

- Also, if you need to remotely manage your node you will want to forward TCP port 22 for
Secure Shell to the node.

---
## Sites I used to get my information from for this build

- SvxLink Original Project Site [here](https://www.svxlink.org/)

- Installation on a Raspberry Pi and link thru a Baofeng [here](https://www.vnutz.com/articles/echolink_on_a_raspberry_pi_with_a_baofeng_uv5r)

- Echolink node on Raspberry Pi using SVXLink [here](http://np2wj.com/echolink-node-on-raspberry-pi-using-svxlink-part-1/)

- Installing SVXLink On Raspberry Pi OS Bullseye [here](https://ccc.myrac.ca/VE6PLC_installing_svxlink.pdf)

- Wiring diagram to DIY a Baofeng to sound card harness [here](https://schematron.org/image/baofeng-headset-wiring-diagram-3.png)

- EchoLink site [here](https://echolink.org/)

---
TODO:

- ~~Hardware list~~

- Installation instructions

- List important configuration files

- Look into All Star link version 3

- ~~Site refernces to sites I use~~
