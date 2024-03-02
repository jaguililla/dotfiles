#!/usr/bin/env bash

sudo pacman -S \
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
  tldr

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java 21.0.2-graalce
yes n|sdk i java 21.0.2-tem

#sudo pacman -S yay base-devel helix aws-cli rofi rofi-emoji podman podman-compose
#sudo pacman -S gnome-boxes guake brave-browser

#yay -S dbvis keystore-explorer-bin

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

echo "export DOTFILES=$DOTFILES" >>~/.bashrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.bashrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.bashrc

echo "export DOTFILES=$DOTFILES" >>~/.zshrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.zshrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.zshrc
