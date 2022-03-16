#!/usr/bin/env bash

sudo pacman -S \
  colordiff \
  yay \
  base-devel \
  keychain \
  git \
  vim \
  gvim \
  neovim \
  neovim-qt \
  docker \
  minikube \
  kubectl \
  aws-cli \
  xclip \
  xsel \
  lxqt-openssh-askpass \
  curl \
  httpie \
  jq \
  nnn \
  zsh \
  wmctrl \
  the_silver_searcher \
  xdotool \
  unrar \
  snapd \
  starship \
  rofi \
  graphviz \
  tldr

#sudo pacman -S gnome-boxes guake brave-browser

yay -S dbvis keystore-explorer-bin

systemctl enable ntpd
systemctl start ntpd

systemctl enable docker
systemctl start docker
user="$(whoami)"
sudo usermod -aG docker $user

systemctl enable snapd
systemctl start snapd

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/archlinux ]] && echo 'Arch Linux settings must exists' && exit 2

ln -f -s $DOTFILES/shell/shellconfig ~/.profile

echo "export DOTFILES=$DOTFILES" >>~/.bashrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.bashrc

echo "export DOTFILES=$DOTFILES" >>~/.zshrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.zshrc

