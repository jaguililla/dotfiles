
Dotfiles
========

This project holds configuration files and scripts for some of the programs and operating systems I
use.

Configuration Files
-------------------

The settings for the backed up programs are stored in a folder per application or system. These are:

* Archlinux: shell configuration files and install script.
* Cygwin: bash settings and [Mintty](http://code.google.com/p/mintty/) terminal emulator
  configuration file.
* Eclipse: IDE preferences, code formatter, save actions, key bindings, etc.
* Windows: Vim configuration files and [Auto Hot Key](http://www.autohotkey.com/) script.

All bash files should be copied to user home (~) with a point (.) before the name. Ie:
profile -> ~/.profile

Arch Linux install script
-------------------------

This script follows (more or less closely) the
[Beginner's Guide](https://wiki.archlinux.org/index.php/Beginners%27_Guide) and the
[General Recommendations](https://wiki.archlinux.org/index.php/General_Recommendations) documents.

The install script is not interactive, you should edit the script file and change the parameters
prior to running it.

Beware of the bugs: This install script is tailored for me, it may or may not suit your needs. Also,
it is not extensively tested hence it may even don't work properly, so use it at your own risk!
