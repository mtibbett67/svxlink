#!/bin/bash
set -e  # Stop script on any error

# 1. Update and Install Dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y g++ cmake make libsigc++-2.0-dev libgsm1-dev libpopt-dev tcl-dev \
     libgcrypt20-dev libspeex-dev libasound2-dev libopus-dev librtlsdr-dev doxygen \
     groff alsa-utils vorbis-tools curl libcurl4-openssl-dev git rtl-sdr \
     libjsoncpp-dev libgpiod-dev libssl-dev ladspa-sdk

# 2. Configure USB Sound Card (Only if found)
USB_CARD=$(grep 'USB\-Audio' /proc/asound/cards | awk '{print $1}' | head -n 1)
if [ -n "$USB_CARD" ]; then
    sudo sed -i "/^defaults.pcm.card/c\defaults.pcm.card $USB_CARD" /usr/share/alsa/alsa.conf
    sudo sed -i "/^defaults.ctl.card/c\defaults.ctl.card $USB_CARD" /usr/share/alsa/alsa.conf
else
    echo "Warning: No USB-Audio card detected. Skipping ALSA config."
fi

# 3. Create User
sudo useradd -rG audio,plugdev,gpio,dialout svxlink || true

# 4. Clone and Build
cd ~
[ -d "svxlink" ] || git clone https://github.com/sm0svx/svxlink.git
cd svxlink
git checkout master
git pull

mkdir -p src/build && cd src/build
cmake -DUSE_QT=OFF -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DWITH_SYSTEMD=ON -DCPACK_GENERATOR=DEB ..
make -j$(nproc) all doc package

# 5. Install the Package
echo "Installing SvxLink package..."
select FILENAME in *.deb quit; do
    if [ "$FILENAME" = "quit" ]; then break;
    elif [ -n "$FILENAME" ]; then
        sudo dpkg -i "$FILENAME"
        sudo apt-get install -f # Fix potential missing dependencies
        break
    fi
done

# 6. Install Sounds (MUST be done after package install so directory exists)
sudo mkdir -p /usr/share/svxlink/sounds/
cd /usr/share/svxlink/sounds/
sudo curl -LO https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/24.02/svxlink-sounds-en_US-heather-16k-24.02.tar.bz2
sudo tar xvjf svxlink-sounds-en_US-heather-16k-24.02.tar.bz2
sudo ln -sfn en_US-heather-16k en_US
sudo rm svxlink-sounds-en_US-heather-16k-24.02.tar.bz2

echo "Installation complete. Please run configure.sh"
