
# Initial Setup

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
  go

systemctl enable docker
systemctl start docker
sudo usermod -aG docker $user

systemctl enable snapd
systemctl start snapd

Language settings can be changed by user in `~/.profile` file:

```
export LANG=es_ES.UTF-8
export LC_NUMERIC=es_ES.UTF-8
export LC_MONETARY=es_ES.UTF-8
export LC_PAPER=es_ES.UTF-8
export LC_NAME=es_ES.UTF-8
export LC_ADDRESS=es_ES.UTF-8
export LC_TELEPHONE=es_ES.UTF-8
export LC_MEASUREMENT=es_ES.UTF-8
export LC_IDENTIFICATION=es_ES.UTF-8
export LC_TIME=es_ES.UTF-8
export PAPERSIZE=a4
export LANGUAGE=es_ES
export LANG=es_ES.UTF-8
```

## KDE
sudo pacman -S \
  yakuake \
  kaccounts-providers \
  ksshaskpass \
  kwallet-pam \
  kcmutils \
  sddm-kcm \
  sddm

## Java
yay -S jdk11-graalvm-bin
sudo pacman -S \
  maven \
  gradle

ln -s ~/Projects/dotfiles/shell/shellconfig" ~/.profile
ln -s ~/Projects/dotfiles/shell/inputrc ~/.inputrc
ln -s ~/Projects/dotfiles/editors/vim/gvimrc ~/.gvimrc
ln -s ~/Projects/dotfiles/editors/vim/vimrc ~/.vimrc
ln -s ~/Projects/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/Projects/dotfiles/git/git-message.txt ~/.git-message.txt

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

# Install Snap

To install Snap package manager check: https://docs.snapcraft.io/core/install-arch-linux

# Arch Linux install script

This script follows (more or less closely) the
[Beginner's Guide](https://wiki.archlinux.org/index.php/Beginners%27_Guide) and the
[General Recommendations](https://wiki.archlinux.org/index.php/General_Recommendations) documents.

The install script is not interactive, you should edit the script file and change the parameters
prior to running it.

Beware of the bugs: This install script is tailored for me, it may or may not suit your needs. Also,
it is not extensively tested hence it may even don't work properly, so use it at your own risk!

