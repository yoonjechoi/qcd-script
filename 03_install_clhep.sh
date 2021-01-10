#!/usr/bin/env bash

# Install clhep-2.4.1.0
mkdir -p ~/download/clhep-2.4.1.0 && \
    cd ~/download/clhep-2.4.1.0

wget https://proj-clhep.web.cern.ch/proj-clhep/dist1/clhep-2.4.1.0.tgz && \
    tar xzf clhep-2.4.1.0.tgz

mkdir clhep-2.4.1.0-build && \
    cd clhep-2.4.1.0-build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/clhep-2.4.1.0 \
    ../2.4.1.0/CLHEP

make -j40

sudo make install
sudo ln -s /usr/local/clhep-2.4.1.0 /usr/local/clhep
