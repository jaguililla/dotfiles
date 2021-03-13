
# Mac OS X install
To install basic packages, run:

To install Docker Toolbox it is necessary to grant permissions in:
`System Preferences... > Security & Privacy > General` after running the `brew` command.

## jEnv
To setup JEnv execute:

```bash
mkdir -p .jenv/versions
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv global 1.8
jenv enable-plugin maven
jenv enable-plugin export
```

The file `ssh_config` can be linked in `$HOME/.ssh/config` to use Keychain to remember passwords.
I.e.: `ln -s $DOTFILES/macosx/ssh_config $HOME/.ssh/config`

Oh My Zsh: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## Python
```bash
brew install python@3

# In .bashrc or .zshrc
export PATH=/usr/local/opt/python@3/Frameworks/Python.framework/Versions/Current/bin:$PATH
```

## Kernel Parameters
```
sudo sysctl -w kern.maxfiles=24500
sudo sysctl -w kern.maxfilesperproc=20480
```

## Disable Mac
