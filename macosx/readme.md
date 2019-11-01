
Mac OS X install
----------------

To install basic packages, run:

```bash
brew unlink docker-compose

brew tap adoptopenjdk/openjdk

brew cask install \
  docker \
  postman \
  firefox \
  adoptopenjdk11 \
  adoptopenjdk8

brew install \
  awscli \
  bash-completion \
  coreutils \
  dep \
  docker \
  docker-compose \
  docker-compose-completion \
  docker-machine \
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
  mongodb \
  vim \
  neovim \
  node \
  ruby \
  scala \
  jenv \
  wget

brew link --overwrite docker-compose
```

The file `ssh_config` can be placed in `$HOME/.ssh/config` to use Keychain to remember passwords.

You could add these lines to your `~/.bash_profile` file:

```bash
source $HOME/Projects/jaguililla/dotfiles/bash/ssh_aliases

source $HOME/Projects/jaguililla/dotfiles/containers/docker_aliases
source $HOME/Projects/jaguililla/dotfiles/containers/minikube_aliases
source $HOME/Projects/jaguililla/dotfiles/containers/minishift_aliases

source $HOME/Projects/jaguililla/dotfiles/vagrant/vagrant_aliases

source $HOME/Projects/jaguililla/dotfiles/git/git_aliases

source $HOME/Projects/jaguililla/dotfiles/macosx/bashconfig
source $HOME/Projects/jaguililla/dotfiles/macosx/aliases
```
