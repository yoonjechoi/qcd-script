#!/usr/bin/env bash


# Install kebi-1
mkdir -p ~/git-repo \
    && cd ~/git-repo

git clone https://github.com/LAMPS-Collaboration/kebi

cd kebi
echo "export KEBIPATH=$(pwd)" >> ~/.profile
source ~/.profile
export KEBIPATH=$(pwd)

echo "Rint.Logon: ${KEBIPATH}/macros/rootlogon.C" >> ~/.rootrc


sudo apt install libboost-dev libboost-all-dev libeigen3-dev

mkdir -p build && \
    cd build 

cmake .. && \
    make -j40
