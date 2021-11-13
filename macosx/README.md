
# Mac OS X install
To install basic packages, run:

To install Docker Toolbox it is necessary to grant permissions in:
`System Preferences... > Security & Privacy > General` after running the `brew` command.

In `.zshrc` add `source ~/Projects/jam/dotfiles/macosx/aliases` before sourcing `shellconfig`.

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

## Disable macOS quarantine 
```bash
sudo xattr -r -d com.apple.quarantine path/to/program/folder/
```
