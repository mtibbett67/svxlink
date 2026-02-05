#! /bin/bash

# Upgrade to the latest pre-release

# Update OS and install packages needed for SvxLink
sudo apt update
sudo apt upgrade
sudo apt install g++ cmake make libsigc++-2.0-dev libgsm1-dev libpopt-dev tcl-dev \
     libgcrypt20-dev libspeex-dev libasound2-dev libopus-dev librtlsdr-dev doxygen\
     groff alsa-utils vorbis-tools curl libcurl4-openssl-dev git rtl-sdr libcurl4-openssl-dev\
     cmake libjsoncpp-dev libgpiod-dev libssl-dev ladspa-sdk

# Download the software from Github and generate a package (.deb)
cd ~/
git clone https://github.com/sm0svx/svxlink.git
cd svxlink
git pull #added
git checkout master #changed from 25.05.01 to master

# Build package from source
mkdir ~/svxlink/src/build
cd ~/svxlink/src/build
cmake -DUSE_QT=OFF -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DWITH_SYSTEMD=ON -DCPACK_GENERATOR=DEB ..

# Build package documentation
make -j4 all doc package

cd ~/svxlink/src/build

# Store the list of files/directories in an array
# We use a shell glob (*) instead of parsing ls output, which is safer
# You could also use `files=( $(ls -A) )` but globs are preferred for handling special characters
echo "Generating list of items in the current directory..."

PS3="Select an item to view details (or type 'quit' to exit): "

# The 'select' command uses the shell glob '*' to populate the menu
select FILENAME in *.deb quit; do
    if [ "$FILENAME" = "quit" ]; then
        echo "Exiting."
        break
    elif [ -n "$FILENAME" ]; then
        sudo dpkg -i "$FILENAME"
        echo "Please run 2_configure.sh"
        break
    else
        echo "Invalid selection. Please enter a number from the list above."
    fi
done
