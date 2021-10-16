#!/usr/bin/env bash

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR 2>/dev/null || greadlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/shell ]] && echo 'Shell settings must exists' && exit 2

ln -s $DOTFILES/shell/inputrc ~/.inputrc

curl -s "https://get.sdkman.io" | bash

echo "export DOTFILES=$DOTFILES" >>~/.zshrc
echo "source $DOTFILES/shell/shellconfig" >>~/.zshrc
echo "source $DOTFILES/shell/zshconfig" >>~/.zshrc
echo "source $DOTFILES/shell/aliases" >>~/.zshrc
echo "source $DOTFILES/shell/ssh_aliases" >>~/.zshrc
