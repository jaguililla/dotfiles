#!/usr/bin/env bash

BASEDIR=$(dirname $0)
BASEPATH=$(readlink -f $BASEDIR 2>/dev/null || greadlink -f $BASEDIR)

export DOTFILES=${1:-"$BASEPATH/.."}
[[ ! -d $DOTFILES ]] && echo 'DOTFILES must exists' && exit 1
[[ ! -d $DOTFILES/shell ]] && echo 'Shell settings must exists' && exit 2

ln -s $DOTFILES/shell/inputrc ~/.inputrc
ln -s $DOTFILES/shell/starship.toml ~/.config/starship.toml

# SDKMAN does not honor ZSH_COMPDUMP variable
curl -s "https://get.sdkman.io" | bash
# sdk i kotlin
# sdk i maven
# sdk i gradle

echo "source \$DOTFILES/shell/shellconfig" >>~/.zshrc
echo "source \$DOTFILES/shell/zshconfig" >>~/.zshrc
echo "source \$DOTFILES/shell/aliases" >>~/.zshrc
echo "source \$DOTFILES/shell/ssh_aliases" >>~/.zshrc
echo "eval \"\$(starship init bash)\"" >>~/.zshrc

echo "source \$DOTFILES/shell/shellconfig" >>~/.bashrc
echo "source \$DOTFILES/shell/aliases" >>~/.bashrc
echo "source \$DOTFILES/shell/ssh_aliases" >>~/.bashrc
echo "eval \"\$(starship init zsh)\"" >>~/.zshrc

