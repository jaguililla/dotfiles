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
