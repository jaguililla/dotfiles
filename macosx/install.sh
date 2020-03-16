#!/usr/bin/env bash

export DOTFILES_HOME=${1:-"~/Projects/dotfiles"}

ln -s "$DOTFILES_HOME/shell/inputrc" ~/.inputrc
ln -s "$DOTFILES_HOME/editors/vim/gvimrc" ~/.gvimrc
ln -s "$DOTFILES_HOME/editors/vim/vimrc" ~/.vimrc
ln -s "$DOTFILES_HOME/git/gitconfig" ~/.gitconfig
ln -s "$DOTFILES_HOME/git/git-message.txt" ~/.git-message.txt

echo "source $DOTFILES_HOME/shell/bashconfig" >>~/.bashrc
echo "source $DOTFILES_HOME/archlinux/pacman_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/aws/aws_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/shell/aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/shell/ssh_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/containers/docker_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/containers/minikube_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/containers/minishift_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/git/git_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/vagrant/vagrant_aliases" >>~/.bashrc

