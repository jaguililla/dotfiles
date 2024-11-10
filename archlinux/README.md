
# Initial Setup
Language settings can be changed by user (not system wide) in `~/.profile` file. Localization
parameters can be changed sourcing `locale.env` in the `~/.profile` file and editing
them there.

# Sudo
Add `Defaults:<user> !authenticate` using `sudo visudo` to disable password.

# Network
It is preferable to use Google public DNS: 8.8.8.8 and 8.8.4.4

# Minimum home settings files
```
.cache/
.cinnamon/
.config/
.gnupg/
.gradle/
.icons/
.java/
.keychain/
.local/
.m2/
.mozilla/
.oh-my-zsh/
.pki/
.ssh/
.themes/
.vim/
.gtkrc-2.0
.bash_logout
.bash_profile
.bashrc
.makepkg.conf
.dir_colors
.dmrc
.face
.gitconfig@
.gvimrc@
.inputrc@
.xsession-errors.old
.profile@
.vimrc@
.Xauthority
.Xclients*
.xinitrc*
.xsession-errors
.zshrc
```

# Arch Linux install script
The script is in the repository tag `archlinux`.

You can also use `archinstall` text installer on Arch install ISO.

# Cinnamon desktop
`cinnamon-session-quit --power-off` to display power-off dialog

For Guake to work properly with `META+CR` the `META` shortcut in the Cinnamon menu must be deleted.
Or map `META+CR` to the command `guake -t`.

