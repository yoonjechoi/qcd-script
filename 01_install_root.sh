#!/usr/bin/env bash

# ROOT 설치
sudo apt install -y libxpm-dev libxft-dev qt5-default qtwebengine5-dev python3.6-dev
mkdir -p ~/git-repo && cd ~/git-repo && \
    git clone -b v6-20-04 https://github.com/root-project/root.git root_src && \
    cd ~/git-repo/root_src

mkdir -p ~/git-repo/root_build 
sudo mkdir -p /usr/local/root-6.20.04

cd ~/git-repo/root_build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local/root-6.20.04 \
    -Dbuiltin_openssl=On \
    -Dcuda=On \
    -Dcudnn=On \
    -Dqt5web=On \
    -Dxrootd=Off \
    -Dbuiltin_xrootd=Off \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    ~/git-repo/root_src && \
    cmake --build . -- -j40
sudo make install


# 모든 유저가 로그인하면 자동으로 source thisroot.sh 실행되게 설정
sudo tee /etc/profile.d/root.sh >/dev/null <<EOF 
source /usr/local/root/bin/thisroot.sh
EOF
