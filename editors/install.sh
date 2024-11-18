#!/usr/bin/env bash

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR 2>/dev/null || greadlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/editors ]] && echo 'Editors settings must exists' && exit 2
[[ -z $IDEA_HOME ]] && echo 'IntelliJ IDEA home must be defined' && exit 3

#ln -s $DOTFILES/editors/fonts ~/.local/share/fonts
#fc-cache -f -v

#mkdir ~/.config/nvim
#ln -s $DOTFILES/editors/vim/gvimrc ~/.config/nvim/
#ln -s $DOTFILES/editors/vim/vimrc ~/.config/nvim/
#ln -s $DOTFILES/editors/vim/init.vim ~/.config/nvim/
#ln -s $DOTFILES/editors/vim/ginit.vim ~/.config/nvim/

ln -s $DOTFILES/editors/intellij/ideavimrc ~/.ideavimrc
ln -s $DOTFILES/editors/intellij/idea.properties "$IDEA_HOME/idea.properties"

