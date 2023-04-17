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
  helix \
  go \
  ripgrep \
  docker \
  docker-compose \
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
  zsh-completions \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  nerd-fonts-noto-sans-mono \
  wmctrl \
  the_silver_searcher \
  xdotool \
  unrar \
  snapd \
  starship \
  rofi \
  rofi-emoji \
  graphviz \
  noto-fonts \
  noto-fonts-extra \
  noto-fonts-emoji \
  python-pip \
  nvm \
  neofetch \
  upx \
  cloc \
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
BASEPATH=$(dirname $BASEPATH)

export DOTFILES=${1:-"$BASEPATH"}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/archlinux ]] && echo 'Arch Linux settings must exists' && exit 2

echo "export DOTFILES=$DOTFILES" >>~/.bashrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.bashrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.bashrc

echo "export DOTFILES=$DOTFILES" >>~/.zshrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.zshrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.zshrc
