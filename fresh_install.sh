#!/bin/bash

# Brandon Pollack
# This is a script to setup debian based systems to my preference

# useless folders...
rm -r ~/Templates
rm -r ~/Pictures
rm -r ~/Videos
rm -r ~/Public

sudo apt-get update

sudo apt-get --assume-yes install \
sshfs \
git \
gdb \
g++ \
gcc \
clang \
valgrind \
openjdk-8-jdk \
python \
python3 \
tmux

sudo apt-get update

sudo apt-get upgrade
