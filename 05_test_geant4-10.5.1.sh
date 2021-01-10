cd ~/download/geant4_10.5.1/geant4-10.5.1/examples/basic
mkdir -p B1_build && cd B1_build

cmake \
    -DGeant4_DIR=/usr/local/geant4/lib \
    ../B1

make -j40 B1
./exampleB1
