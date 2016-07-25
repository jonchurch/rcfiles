#!/bin/bash
set -e

$USER=brandon

if [ "$(id -u)" != "0" ]; then
    echo "in order to make this script run with less hassle, run it as root"
    exit 1
fi

# Author: Brandon Pollack
# This is a script to setup debian based systems to my preference

# useless folders...
rm -r ~/Templates
rm -r ~/Pictures
rm -r ~/Videos
rm -r ~/Public

sudo apt-get update

sudo apt --assume-yes install \
gnome-terminal \
sshfs \
git \
curl \
gdb \
g++ \
gcc \
clang \
cmake \
valgrind \
openjdk-8-jdk \
python \
python3 \
zsh \
tree \
tmux

#nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get update
sudo apt install -y nodejs

sudo apt -y update

sudo apt -y upgrade

#get dircolors solarized, the symbolic link will point to a config here
git clone https://github.com/seebi/dircolors-solarized src/dircolors-solarized 

#get gterm colors solarized config and execute the script
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git \
    src/gnome-terminal-colors-solarized
cd src/gnome-terminal-colors-solarized/
./install.sh -s dark -p Default
cd $HOME

#vim, need to get latest version and have all the right modules
git clone https://github.com/vim/vim.git src/vim
cd src/vim
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

#nvim
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo apt install -y xclip
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p $HOME/.vim
ln -s ~/.vim/ $XDG_CONFIG_HOME/nvim/
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
sudo pip3 install --upgrade pip
sudo pip2 install --upgrade pip
sudo pip3 install --upgrade neovim
sudo pip2 install --upgrade neovim
#vim-plug setup nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#vim-plug setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

#change shell to zsh
#TODO add and configure oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/zsh-syntax-highlighting
chsh $USER -s /bin/zsh
sudo ln -s /home/brandon/.oh-my-zsh /root/.oh-my-zsh
sudo rm /root/.zshrc
sudo ln -s /home/brandon/.zshrc /root/.zshrc
