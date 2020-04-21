
BASH
====

It is necessary to add SSH keys to keychain in `.bashrc` after calling `bashconfig`.
Add the following line:

    eval $(keychain --eval --quiet <key1> <key2> <keyn>)

To allow using sudo without password. It is necessary to add the following line with
`visudo`:

    Defaults:<user> !authenticate

`shellconfig` file is meant to be used in any shell config (Bash or Zsh) and should
be sourced at the end of these shells' configuration files.

For Zsh (using Oh My Zsh) add the following plugins for a great prompt:

```
plugins=(
	docker
	git-prompt
	zsh-navigation-tools
	zsh-autosuggestions
	zsh-syntax-highlighting
)
```

Some of these plugins are located in: https://github.com/zsh-users and must be
installed separately.

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Spaceship ZSH Theme

```
git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
```
