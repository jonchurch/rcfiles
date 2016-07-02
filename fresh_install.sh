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
zsh \
tmux

sudo apt-get update

sudo apt-get upgrade

#get dircolors solarized, the symbolic link will point to a config here
git clone https://github.com/seebi/dircolors-solarized src/dircolors-solarized 

#get gterm colors solarized config and execute the script
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git \
    src/gnome-terminal-colors-solarized
cd src/gnome-terminal-colors-solarized/
./install.sh -s dark -p Default
cd $HOME

#powerline
git clone https://github.com/milkbikis/powerline-shell src/powerline-shell
cd src/powerline-shell
./install.py
ln $HOME/src/powerline-shell/powerline-shell.py $HOME/powerline-shell.py
pip install argparse
cd $HOME

#vim, need to get latest version and have all the right modules
git clone https://github.com/vim/vim.git src/vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 --enable-cscope
make VIMRUNTIMEDIR=/usr/share/vim/vim74 && sudo make install
cd $HOME

#change shell to zsh
csh /bin/zsh
