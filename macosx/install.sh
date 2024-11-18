#!/usr/bin/env bash

set -e

brew install --cask docker

#brew install \
#  firefox \
#  google-chrome \
#  git \
#  kubernetes-cli \
#  kubernetes-helm \
#  taskwarrior-tui \
#  taskwarrior-pomodoro \
#  hammerspoon \
#  alt-tab \
#  rectangle

brew install \
  go \
  kubectl \
  the_silver_searcher \
  unrar \
  nvm \
  upx \
  bottom \
  tealdeer \
  procs \
  dust \
  vscodium \
  imagemagick \
  fzf

brew install \
  virtualbox \
  gimp \
  inkscape \
  neovim \
  bash-completion \
  coreutils \
  fdupes \
  gnu-tar \
  graphviz \
  httpie \
  jq \
  node \
  ruby \
  neofetch \
  plantuml \
  lsd \
  bat \
  colordiff \
  ripgrep \
  yazi \
  cloc \
  zoxide \
  fd \
  sd \
  wget

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR 2>/dev/null || greadlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1

ln -s $DOTFILES/git/gitconfig ~/.gitconfig

#echo "alias dircolors='gdircolors'" >>~/.zshrc
#echo "source $DOTFILES/aws/aws_aliases" >>~/.zshrc
#echo "source $DOTFILES/containers/docker_aliases" >>~/.zshrc
#echo "source $DOTFILES/containers/minikube_aliases" >>~/.zshrc
#echo "source $DOTFILES/git/git_aliases" >>~/.zshrc
#echo "source $DOTFILES/vagrant/vagrant_aliases" >>~/.zshrc

echo "export DOTFILES=$DOTFILES" >>~/.bashrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.bashrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.bashrc

echo "export DOTFILES=$DOTFILES" >>~/.zshrc
echo "source \$DOTFILES/archlinux/pacman_aliases" >>~/.zshrc
echo "source \$DOTFILES/shell/shellconfig" >>~/.zshrc

