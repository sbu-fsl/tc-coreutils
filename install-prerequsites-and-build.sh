#!/bin/bash
# Compile coreutils on centOS
#
# by Garima Gehlot, garima.gehlot@stonybrook.edu
#=============================================================================

sudo yum install -y texinfo
sudo yum install -y gperf
sudo yum install -y gzip

COREUTILS_DIR=$PWD
cd ..
#compile gettext source and install
sudo wget https://ftp.gnu.org/gnu/gettext/gettext-0.19.2.tar.xz
sudo tar -xvf gettext-0.19.2.tar.xz
cd gettext-0.19.2
sudo ./configure
sudo make
sudo make check
sudo make install

#compile coreutils
cd $COREUTILS_DIR
./bootstrap
export FORCE_UNSAFE_CONFIGURE=1
sudo -E ./configure
sudo make
