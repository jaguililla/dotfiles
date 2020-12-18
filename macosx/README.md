
Mac OS X install
----------------

To install basic packages, run:

To install Docker Toolbox it is necessary to grant permissions in:
`System Preferences... > Security & Privacy > General` after running the `brew` command.

```bash
brew unlink docker-compose

brew tap adoptopenjdk/openjdk
brew tap mongodb/brew

brew install \
  virtualbox \
  docker \
  docker-toolbox \
  postman \
  gimp \
  inkscape \
  firefox \
  google-chrome \
  adoptopenjdk11 \
  macvim \
  adoptopenjdk8 \
  awscli \
  bash-completion \
  coreutils \
  dep \
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
  mongodb-community \
  node \
  ruby \
  jenv \
  nnn \
  wget

brew link --overwrite docker-compose
```

To setup JEnv execute:

```bash
mkdir -p .jenv/versions
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv global 1.8
jenv enable-plugin maven
jenv enable-plugin export
```

The file `ssh_config` can be placed in `$HOME/.ssh/config` to use Keychain to remember passwords.

You could add these lines to your `~/.bash_profile` file:

```bash
source $HOME/Projects/jaguililla/dotfiles/shell/ssh_aliases

source $HOME/Projects/jaguililla/dotfiles/containers/docker_aliases
source $HOME/Projects/jaguililla/dotfiles/containers/minikube_aliases
source $HOME/Projects/jaguililla/dotfiles/containers/minishift_aliases

source $HOME/Projects/jaguililla/dotfiles/vagrant/vagrant_aliases

source $HOME/Projects/jaguililla/dotfiles/git/git_aliases

source $HOME/Projects/jaguililla/dotfiles/macosx/bashconfig
source $HOME/Projects/jaguililla/dotfiles/macosx/aliases
```

Oh My Zsh: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
