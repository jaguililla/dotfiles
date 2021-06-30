
# BASH
All bash files should be copied to user home (~) with a point (.) before the name. Ie:
profile -> ~/.profile

To allow using sudo without password. It is necessary to add the following line with
`visudo`:

    Defaults:<user> !authenticate

`shellconfig` file is meant to be used in any shell config (Bash or Zsh) and should
be sourced at the end of these shells' configuration files.

To change shell. Use: `chsh --help`

## ZSH
Oh My ZSH:

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

For Zsh (using Oh My Zsh) add the following plugins for a great prompt:

```
plugins=(
#  docker
#  git-prompt
  zsh-navigation-tools
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)
```

Some of these plugins are located in: https://github.com/zsh-users and must be
installed separately.

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Oh My ZSH

Run `export ZSH_COMPDUMP="$ZSH/cache/.zcompdump"` before Oh My ZSH to change cache file directory.

This can be done with `source ~/Projects/jam/dotfiles/shell/shellconfig` before
`source $ZSH/oh-my-zsh.sh`.

## Z

```
git clone https://github.com/agkozak/zsh-z "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z"
```

## Starship Prompt

```bash
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init zsh)"'>>$HOME/.zshrc
ln -s $DOTFILES/shell/starship.toml $HOME/.config/starship.toml
```
