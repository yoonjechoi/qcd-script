#!/usr/bin/env bash
#Install geant4 10.5.1

mkdir -p ~/download/geant4_10.5.1 && \
    cd ~/download/geant4_10.5.1
wget https://github.com/Geant4/geant4/archive/v10.5.1.tar.gz && \
    tar xzf v10.5.1.tar.gz

mkdir geant4-10.5.1-build && \
    cd geant4-10.5.1-build 

sudo apt-get install libxerces-c-dev libxmu-dev


cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/geant4-10.5.1 \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_USE_OPENGL_X11=ON \
    -DGEANT4_USE_QT=ON \
    -DGEANT4_BUILD_MULTITHREADED=ON \
    ../geant4-10.5.1

make -j40

sudo make install
sudo ln -s /usr/local/geant4-10.5.1 /usr/local/geant4

sudo tee /etc/profile.d/geant4.sh >/dev/null <<EOF 
source /usr/local/geant4/bin/geant4.sh
EOF

