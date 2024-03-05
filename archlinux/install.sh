#!/usr/bin/env bash

sudo pacman -S \
  xorg-xkill \
  base-devel \
  gcc \
  pacman-contrib \
  colordiff \
  git \
  neovim \
  go \
  ripgrep \
  docker \
  docker-compose \
  minikube \
  kubectl \
  xclip \
  xsel \
  httpie \
  jq \
  nnn \
  wmctrl \
  the_silver_searcher \
  xdotool \
  unrar \
  graphviz \
  noto-fonts \
  noto-fonts-extra \
  noto-fonts-emoji \
  ttf-noto-nerd \
  python-pip \
  nvm \
  neofetch \
  upx \
  cloc \
  bottom \
  tealdeer \
  zoxide \
  bat \
  lsd \
  fd \
  procs \
  sd \
  dust \
  code \
  fzf

#sudo pacman -S \
#  yay \
#  helix \
#  aws-cli \
#  rofi \
#  rofi-emoji \
#  podman \
#  podman-compose \
#  brave-browser

#brew install dbvis keystore-explorer-bin

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java 21.0.2-graalce
yes n|sdk i java 21.0.2-tem

#systemctl enable ntpd
#systemctl start ntpd

systemctl enable docker
systemctl start docker
user="$(whoami)"
sudo usermod -aG docker $user

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR)
BASEPATH=$(dirname $BASEPATH)

export DOTFILES=${1:-"$BASEPATH"}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/archlinux ]] && echo 'Arch Linux settings must exists' && exit 2

echo "export DOTFILES=$DOTFILES" >>~/.{bash,zsh}rc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.{bash,zsh}rc
echo "source \$DOTFILES/shell/shellconfig" >>~/.{bash,zsh}rc

