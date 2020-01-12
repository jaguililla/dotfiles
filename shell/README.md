
BASH
====

It is necessary to add SSH keys to keychain in `.bashrc` after calling `bashconfig`.
Add the following line:

    eval $(keychain --eval --quiet <key1> <key2> <keyn>)

To allow using sudo without password. It is necessary to add the following line with
`visudo`:

    Defaults:<user> !authenticate

