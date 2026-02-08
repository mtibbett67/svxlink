#!/bin/bash
set -e # Stop script on any error

# --- Variables ---
# Prompt for credentials instead of hardcoding
read -p "Enter Callsign: " callsign
read -ps "Enter EchoLink Password: " password
echo
read -p "Enter Sysop Name: " sysop_name
read -p "Enter Location: " location
read -p "Enter Description: " description
echo

# You can update these values here, or use 'read' to prompt at runtime
#callsign=MyCallSign
#password=MyPassword
#sysop_name=Elmer
#location="Albuquerque, NM"
#ndescription="Testing EchoLink Node"

# --- 1. Event and Sound System Directories ---
# Replicating the logic to create local-events.d and local-sounds.d
sudo mkdir -p /etc/svxlink/local-events.d
sudo mkdir -p /etc/svxlink/local-sounds.d

# Establishing symbolic links for the event system
# Using -sfn to ensure links are created correctly even if they already exist
sudo ln -sfn /etc/svxlink/local-events.d /usr/share/svxlink/events.d/local
sudo ln -sfn /etc/svxlink/local-sounds.d /usr/share/svxlink/sounds/local

# --- 2. Main SvxLink Configuration (/etc/svxlink/svxlink.conf) ---
SVX_CONF="/etc/svxlink/svxlink.conf"
[ -f "$SVX_CONF.original" ] || sudo cp "$SVX_CONF" "$SVX_CONF.original"

# Tuning and Performance
sudo sed -i "/PREAMP/c\PREAMP=6" "$SVX_CONF"
sudo sed -i "/DEEMPHASIS/c\DEEMPHASIS=1" "$SVX_CONF"
sudo sed -i "/VOX_THRESH/c\VOX_THRESH=500" "$SVX_CONF"
sudo sed -i "/PEAK_METER/c\#PEAK_METER=1" "$SVX_CONF"

# Configure Radio Interface and Identity
sudo sed -i "/^#CARD_CHANNELS=1/c\CARD_CHANNELS=1" "$SVX_CONF"
sudo sed -i "/^CALLSIGN/c\CALLSIGN=$callsign" "$SVX_CONF"

# Dynamic Audio Device Detection
USB_DEV=$(grep 'USB\-Audio' /proc/asound/cards | awk '{print $1}' | head -n 1)
if [ -n "$USB_DEV" ]; then
  sudo sed -i "/^AUDIO_DEV/c\AUDIO_DEV=alsa:plughw:$USB_DEV" "$SVX_CONF"
fi

# --- 3. EchoLink Module Configuration (/etc/svxlink/svxlink.d/ModuleEchoLink.conf) ---
ECHO_CONF="/etc/svxlink/svxlink.d/ModuleEchoLink.conf"
[ -f "$ECHO_CONF.original" ] || sudo cp "$ECHO_CONF" "$ECHO_CONF.original"

# Registration and Identification
sudo sed -i "/^CALLSIGN/c\CALLSIGN=$callsign-R" "$ECHO_CONF"

# Handle Password (Check for both commented and uncommented versions)
sudo sed -i "/^#PASSWORD/c\PASSWORD=$password" "$ECHO_CONF"
sudo sed -i "/^PASSWORD/c\PASSWORD=$password" "$ECHO_CONF"

# Personalization and Location Strings
sudo sed -i "/^SYSOPNAME/c\SYSOPNAME=$sysop_name" "$ECHO_CONF"
sudo sed -i "/^LOCATION/c\LOCATION=$location" "$ECHO_CONF"
sudo sed -i "/^DESCRIPTION/c\DESCRIPTION=$description" "$ECHO_CONF"

echo "Configuration complete."
