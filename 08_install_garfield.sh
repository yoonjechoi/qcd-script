#!/usr/bin/env bash

# Install garfield
sudo apt install -y libgsl-dev
mkdir -p ~/git-repo && cd ~/git-repo && \
    git clone https://gitlab.cern.ch/garfield/garfieldpp.git
    cd ~/git-repo/garfieldpp

mkdir build && \
    cd build 

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/garfieldpp ..
make -j40

sudo make install

sudo tee /etc/ld.so.conf.d/garfield.conf >/dev/null <<EOF 
/usr/local/garfieldpp/lib
EOF

sudo cp setup.sh /etc/profile.d/garfieldpp.sh
