#!/usr/bin/env bash

export DOTFILES_HOME=${1:-"~/Projects/dotfiles"}

ln -s $DOTFILES_HOME/shell/inputrc ~/.inputrc
ln -s $DOTFILES_HOME/editors/vim/gvimrc ~/.gvimrc
ln -s $DOTFILES_HOME/editors/vim/vimrc ~/.vimrc
ln -s $DOTFILES_HOME/git/gitconfig ~/.gitconfig

echo "alias dircolors='gdircolors'" >>~/.bashrc
echo "source $DOTFILES_HOME/shell/bashconfig" >>~/.bashrc
echo "source $DOTFILES_HOME/aws/aws_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/shell/aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/shell/ssh_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/containers/docker_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/containers/minikube_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/git/git_aliases" >>~/.bashrc
echo "source $DOTFILES_HOME/vagrant/vagrant_aliases" >>~/.bashrc

echo "alias dircolors='gdircolors'" >>~/.zshrc
echo "source $DOTFILES_HOME/shell/shellconfig" >>~/.zshrc
echo "source $DOTFILES_HOME/shell/zshconfig" >>~/.zshrc
echo "source $DOTFILES_HOME/aws/aws_aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/shell/aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/shell/ssh_aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/containers/docker_aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/containers/minikube_aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/git/git_aliases" >>~/.zshrc
echo "source $DOTFILES_HOME/vagrant/vagrant_aliases" >>~/.zshrc
