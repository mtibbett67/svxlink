#! /bin/bash

# For a truly portable configuration, you're unlikely to have a keyboard and
# monitor attached to the Raspberry Pi. This simple script automatically
# adjusts the svxlink.conf file with the current USB audio card device and then
# starts the service if it's not running. Utilize a simple cron job to run on a
# periodic interval to keep SvxLink operating.

varCARD=`arecord -l | grep card | cut -d " " -f 2 | cut -d ":" -f1`
sudo sed -i "/^AUDIO_DEV/c\AUDIO_DEV=alsa:plughw:$varCARD" /etc/svxlink/svxlink.conf

if  systemctl status svxlink | grep "Active: active (running)"; then
    printf "[*] ECHOLINK nominal\n";
else
    printf "[!] ECHOLINK missing...Restarting SvxLink\n";
    sudo systemctl restart svxlink && systemctl status svxlink | grep "Active: active (running)";
fi
