
Mac OS X install
----------------

To install basic packages, run:

```bash
brew unlink docker-compose

brew tap adoptopenjdk/openjdk

brew cask install \
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
```

