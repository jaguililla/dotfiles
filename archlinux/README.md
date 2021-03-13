
# Initial Setup

Language settings can be changed by user (not system wide) in `~/.profile` file:

Localization parameters can be changed sourcing `locale.env` in the `~/.profile` file and editing
them there.

ln -s ~/Projects/dotfiles/shell/shellconfig" ~/.profile
ln -s ~/Projects/dotfiles/shell/inputrc ~/.inputrc
ln -s ~/Projects/dotfiles/editors/vim/gvimrc ~/.gvimrc
ln -s ~/Projects/dotfiles/editors/vim/vimrc ~/.vimrc
ln -s ~/Projects/dotfiles/editors/intellij/ideavimrc ~/.ideavimrc
ln -s ~/Projects/dotfiles/git/gitconfig ~/.gitconfig

echo "source ~/Projects/dotfiles/shell/bashconfig" >>~/.bashrc
echo "source ~/Projects/dotfiles/archlinux/pacman_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/aws/aws_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/shell/aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/shell/ssh_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/containers/docker_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/containers/minikube_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/git/git_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/vagrant/vagrant_aliases" >>~/.bashrc

echo "source ~/Projects/dotfiles/shell/zshconfig" >>~/.zshrc
echo "source ~/Projects/dotfiles/archlinux/pacman_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/aws/aws_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/shell/aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/shell/ssh_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/containers/docker_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/containers/minikube_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/git/git_aliases" >>~/.zshrc
echo "source ~/Projects/dotfiles/vagrant/vagrant_aliases" >>~/.zshrc

# Minimum home settings files

```
.cache/
.cinnamon/
.config/
.gnupg/
.gradle/
.icons/
.java/
.keychain/
.local/
.m2/
.mozilla/
.oh-my-zsh/
.pki/
.ssh/
.themes/
.vim/
.gtkrc-2.0
.bash_logout
.bash_profile
.bashrc
.makepkg.conf
.dir_colors
.dmrc
.face
.gitconfig@
.gvimrc@
.inputrc@
.xsession-errors.old
.profile@
.vimrc@
.Xauthority
.Xclients*
.xinitrc*
.xsession-errors
.zshrc
```

# Setup SDDM

sudo systemctl -f enable sddm

# Arch Linux install script

The script is in the repository tag `archlinux`.
