
# Initial Setup

sudo pacman -S \
  yakuake \
  kaccounts-providers \
  ksshaskpass \
  keychain \
  kwallet-pam \
  kcmutils \
  sddm-kcm \
  sddm \
  git \
  vim \
  gvim \
  neovim \
  vagrant \
  docker \
  docker-compose \
  minikube \
  maven \
  gradle \
  kubectl \
  virtualbox \
  aws-cli \
  xclip \
  xsel \
  curl \
  httpie \
  jq \
  go

ln -s ~/Projects/dotfiles/bash/inputrc .inputrc
ln -s ~/Projects/dotfiles/vim/gvimrc .gvimrc
ln -s ~/Projects/dotfiles/vim/vimrc .vimrc
ln -s ~/Projects/dotfiles/git/gitconfig .gitconfig
ln -s ~/Projects/dotfiles/git/git-message.txt .git-message.txt

echo "source ~/Projects/dotfiles/bash/bashconfig" >>~/.bashrc
echo "source ~/Projects/dotfiles/archlinux/pacman_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/aws/aws_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/bash/aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/bash/ssh_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/containers/docker_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/containers/minikube_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/containers/minishift_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/git/git_aliases" >>~/.bashrc
echo "source ~/Projects/dotfiles/vagrant/vagrant_aliases" >>~/.bashrc

# Setup SDDM

sudo systemctl -f enable sddm

# Install Snap

To install Snap package manager check: https://docs.snapcraft.io/core/install-arch-linux
