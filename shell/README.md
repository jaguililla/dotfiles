
# BASH
All bash files should be copied to user home (~) with a point (.) before the name. Ie:
profile -> ~/.profile

To allow using sudo without password. It is necessary to add the following line with
`visudo`:

    Defaults:<user> !authenticate

`shellconfig` file is meant to be used in any shell config (Bash or Zsh) and should
be sourced at the end of these shells' configuration files.

To change shell. Use: `chsh --shell $(which zsh)`

