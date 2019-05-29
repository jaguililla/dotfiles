
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

echo "source ~Projects/dotfiles/bash/bashconfig" >>~/.bashrc

# Setup SDDM

sudo systemctl -f enable sddm

# Install Snap

To install Snap package manager check: https://docs.snapcraft.io/core/install-arch-linux
