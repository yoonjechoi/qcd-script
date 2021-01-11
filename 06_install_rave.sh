#!/usr/bin/env bash

# Install rave
mkdir -p ~/git-repo && \
    cd git-repo

git clone https://github.com/yoonjechoi/rave && \
    cd rave

# sudo apt-get install -y autoconf

./bootstrap

CXXFLAGS="-std=c++14 -g -O2" ./configure \
    --prefix=/usr/local/rave \
    --with-clhep=/usr/local/clhep \
    --with-boost=yes 

make -j40

sudo make install

sudo tee /etc/ld.so.conf.d/rave.conf >/dev/null <<EOF 
/usr/local/rave/lib
EOF
