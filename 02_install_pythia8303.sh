#!/usr/bin/env bash

# Install pythia

mkdir ~/download/pythia && cd ~/download/pythia
wget http://home.thep.lu.se/~torbjorn/pythia8/pythia8303.tgz
tar xvfz pythia8303.tgz && cd pythia8303

./configure \
    --with-root=/usr/local/root \
    --prefix=/usr/local/pythia8303

make -j40
sudo make install

cd examples 
make -j40 main91 && ./main91

