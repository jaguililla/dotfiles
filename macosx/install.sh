#!/usr/bin/env sh

brew unlink docker-compose

brew tap adoptopenjdk/openjdk
brew tap mongodb/brew

brew install \
  virtualbox \
  docker \
  docker-toolbox \
  postman \
  gimp \
  inkscape \
  firefox \
  google-chrome \
  adoptopenjdk11 \
  macvim \
  adoptopenjdk8 \
  awscli \
  bash-completion \
  coreutils \
  dep \
  fdupes \
  git \
  git-extras \
  gnu-tar \
  graphviz \
  groovy \
  httpie \
  jq \
  kotlin \
  kubernetes-cli \
  kubernetes-helm \
  maven \
  gradle \
  mongodb-community \
  node \
  ruby \
  jenv \
  nnn \
  taskwarrior-tui \
  taskwarrior-pomodoro \
  hammerspoon \
  neofetch \
  plantuml \
  alt-tab \
  wget

brew link --overwrite docker-compose

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR 2>/dev/null || greadlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1

ln -s $DOTFILES/git/gitconfig ~/.gitconfig

echo "alias dircolors='gdircolors'" >>~/.bashrc
echo "source $DOTFILES/aws/aws_aliases" >>~/.bashrc
echo "source $DOTFILES/containers/docker_aliases" >>~/.bashrc
echo "source $DOTFILES/containers/minikube_aliases" >>~/.bashrc
echo "source $DOTFILES/git/git_aliases" >>~/.bashrc
echo "source $DOTFILES/vagrant/vagrant_aliases" >>~/.bashrc

echo "alias dircolors='gdircolors'" >>~/.zshrc
echo "source $DOTFILES/aws/aws_aliases" >>~/.zshrc
echo "source $DOTFILES/containers/docker_aliases" >>~/.zshrc
echo "source $DOTFILES/containers/minikube_aliases" >>~/.zshrc
echo "source $DOTFILES/git/git_aliases" >>~/.zshrc
echo "source $DOTFILES/vagrant/vagrant_aliases" >>~/.zshrc
