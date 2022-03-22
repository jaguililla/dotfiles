
# Dotfiles
This project holds configuration files and scripts for some programs and operating systems I use.

The settings for the backed up programs are stored in a folder per application or system (sometimes
grouped by a directory). More information can be found in `README.md` files inside subdirectories.

Some deprecated programs' settings were deleted, but they can be found inside repository tags.

## TODO
* Create `install.sh` scripts to install independent modules.
* Run set up scripts based on the OS (i.e.: different commands for Linux and macOS)
* Add Scoop section for Windows

```bash
scoop bucket add extras
scoop bucket add nerd-fonts

scoop install ag graphviz greenshot nvm neovim unxutils python starship
scoop install jetbrainsmono-nf-mono jetbrainsmono-nf
```

# Windows
* For links to work: Settings > Update & Security > For developers > Developer Mode [On]. And add:
  `export MSYS="winsymlinks:nativestrict"` to your shell configuration

