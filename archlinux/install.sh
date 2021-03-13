#!/usr/bin/env sh

sudo pacman -S \
  yay \
  base-devel \
  keychain \
  git \
  vim \
  gvim \
  neovim \
  vagrant \
  docker \
  docker-compose \
  minikube \
  kubectl \
  virtualbox \
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
  kotlin \
  go

yay -S dbvis keystore-explorer-bin

systemctl enable docker
systemctl start docker
sudo usermod -aG docker $user

systemctl enable snapd
systemctl start snapd

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/archlinux ]] && echo 'Arch Linux settings must exists' && exit 2

ln -s $DOTFILES/shell/shellconfig ~/.profile

echo "source $DOTFILES/archlinux/pacman_aliases" >>~/.bashrc
echo "source $DOTFILES/archlinux/pacman_aliases" >>~/.zshrc
