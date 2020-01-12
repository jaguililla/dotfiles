
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

