#!/bin/sh

###############################################################################################
#
# Arch Linux install script
#
# It isn't interactive, you need to set the variables
# To change partitions, use 'gdisk' before running this script
#
# For reference see: Beginner's Guide & General Recommendations in the Arch Linux Wiki
# Start ISO with vga=ask for a pleasant console installation
#
###############################################################################################

# V A R I A B L E S ###########################################################################
WEB_FILES='https://raw.githubusercontent.com/jamming/dotfiles/master/archlinux'

KB_LAYOUT='es'

BOOT_DISK='/dev/sda'

PARTITION_BOOT="${BOOT_DISK}5"
PARTITION_SWAP="${BOOT_DISK}6"
PARTITION_ROOT="${BOOT_DISK}7"
PARTITION_HOME="${BOOT_DISK}8"

#
# Partition sizes in MB
# Home takes the remaining disk space
# NOT USED could be used in the future to create the partition table
#
SIZE_BOOT=100
SIZE_SWAP=8000
SIZE_ROOT=70000

FILESYSTEM_BOOT='ext2'
FILESYSTEM_ROOT='ext4'
FILESYSTEM_HOME='ext4'

SYSTEM_CHIP='intel'                     # 'amd' or 'intel'
SYSTEM_LOCALE='en_US.UTF-8'
SYSTEM_SECOND_LOCALE='es_ES.UTF-8'
SYSTEM_ENCODING='UTF-8'
SYSTEM_TIMEZONE='Europe/Madrid'

SYSTEM_USER='jam'
SYSTEM_HOST="${SYSTEM_USER}host"

NETWORK_IFACE='enp0s3'
WIFI_IFACE='w'

XDRIVER=''                              # X Driver package
XDRIVER_MODULE='nvidia'                 # X Driver module

# C H E C K S #################################################################################
lspci|grep 'VirtualBox' >/dev/null
[ $? == 0 ] && VBOX=true
[ $VBOX == true ] && XDRIVER=''

# A L I A S E S ###############################################################################
alias pac='pacman --noconfirm'
alias spac='sudo pacman --noconfirm'

alias pacins='pac -S'
alias pacrem='pac -Rns'
alias pacupg='pac -Syu'

alias spacins='spac -S'
alias spacrem='spac -Rns'
alias spacupg='spac -Syu'

alias svim='sudo vim'

# H E L P E R   F U N C T I O N S #############################################################
pause () {
    [ "$1" != "" ] && echo $1
    read pauseReply
}

subs () {
    [ "$1" != "" -a "$3" != "" ] && sed -i~ "s/$1/$2/g" $3
}

# F U N C T I O N S ###########################################################################

##### I N S T A L L #####

performInstall () {
    clear
    cat <<EOD

==================================================================
        A R C H   L I N U X   I N S T A L L   S C R I P T
==================================================================

EOD

    setupConsole
    pause 'Check disk partitions. Press enter to continue'
    gdisk
    setupDisk
    setupPacman
    setupDate

    pacstrap /mnt base base-devel
    mountSystem
    arch-chroot /mnt /install.sh chroot

    umount /mnt/{boot,home,}
    reboot
}

setupConsole () {
    loadkeys $KB_LAYOUT
    setfont Lat2-Terminus16
    set -o vi
}

setupDisk () {
    cat <<EOD

DISK STATE =======================================================

$(lsblk -f $BOOT_DISK)

VARIABLES ========================================================

SWAP    $PARTITION_SWAP     [SWAP]      $SIZE_SWAP MB
/       $PARTITION_ROOT     [$FILESYSTEM_ROOT]      $SIZE_ROOT MB
/boot   $PARTITION_BOOT     [$FILESYSTEM_BOOT]      $SIZE_BOOT MB
/home   $PARTITION_HOME     [$FILESYSTEM_HOME]      REMAINING SPACE

EOD

    pause 'ALL YOUR DATA WILL BE WIPED OUT! Do you want to continue? [yN]'
    [ "$pauseReply" != "y" ] && exit 1
    pause 'Please check again. Do you want to continue? [yN]'
    [ "$pauseReply" != "y" ] && exit 1

    echo "Formatting $PARTITION_BOOT [$FILESYSTEM_BOOT]"
    mkfs -t $FILESYSTEM_BOOT $PARTITION_BOOT
    echo "Formatting $PARTITION_SWAP [SWAP]"
    mkswap $PARTITION_SWAP
    echo "Formatting $PARTITION_ROOT [$FILESYSTEM_ROOT]"
    mkfs -t $FILESYSTEM_ROOT $PARTITION_ROOT
    echo "Formatting $PARTITION_HOME [$FILESYSTEM_HOME]"
    mkfs -t $FILESYSTEM_HOME $PARTITION_HOME

    mount $PARTITION_ROOT /mnt
    mkdir /mnt/home
    mount $PARTITION_HOME /mnt/home
    mkdir /mnt/boot
    mount $PARTITION_BOOT /mnt/boot

    cat <<EOD

FILESYSTEMS ======================================================

$(mount|grep "^$BOOT_DISK")

Disk setup completed.

EOD
}

# Use rankmirror to get the fastest mirror
setupPacman () {
    echo "Generating list of mirrors. This can take a long time, please be patient!"
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.all
    mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist~
    rankmirrors -n 6 /etc/pacman.d/mirrorlist~ >/etc/pacman.d/mirrorlist
    cat /etc/pacman.d/mirrorlist
    echo && pause 'List of mirrors. Press any key to continue...'

    [ "$(uname -m)" == "x86_64" ] && cat <<EOD >>/etc/pacman.conf
[multilib]
SigLevel = PackageRequired
Include = /etc/pacman.d/mirrorlist

EOD
    cat /etc/pacman.conf
    pause 'Pacman configuration (check multilib if x86_64). Press any key to continue...'
}

setupDate () {
    date
    echo && pause 'Is date correct? [Yn]'
    [ "$pauseReply" == "n" ] && exit 1
}

mountSystem () {
    genfstab -p /mnt >> /mnt/etc/fstab
    subs ',data=ordered' '' /mnt/etc/fstab
    echo
    echo "FSTAB: Check the last field is '1' only for the root ('/') partition."
    echo "Also you can remove tmpfs if you are short on RAM."
    pause "Press any key to edit the file... "
    vi /mnt/etc/fstab
    cp install.sh /mnt # Copy this install script to the new root
}

##### C H R O O T #####

performChroot () {
    setupLocale
    setupNetwork
    setupInitramdisk 
    setupBootloader
    echo && echo "Enter 'root' password:"
    passwd
    # Keep tty output
    GETTY='/etc/systemd/system/getty.target.wants/getty@tty1.service'
    subs 'TTYVTDisallocate=yes' 'TTYVTDisallocate=no' $GETTY
    rm "$GETTY~"
}

# See https://wiki.archlinux.org/index.php/Time#UTC_in_Windows
setupLocale () {
    echo "$SYSTEM_LOCALE $SYSTEM_ENCODING" >>/etc/locale.gen
    [ "$SYSTEM_SECOND_LOCALE" != "" ] && \
        echo "$SYSTEM_SECOND_LOCALE $SYSTEM_ENCODING" >>/etc/locale.gen
    locale-gen

    echo LANG=${SYSTEM_LOCALE} > /etc/locale.conf
    export LANG=${SYSTEM_LOCALE}
    locale > /etc/locale.conf
    subs 'LC_ALL=' '' /etc/locale.conf
    echo && echo "LOCALE.CONF: Change variables that apply (LC_TIME, LC_MONETARY...)"
    pause "Press any key to edit the file..."
    vi /etc/locale.conf

    cat <<EOD >>/etc/vconsole.conf
KEYMAP=$KB_LAYOUT
FONT=Lat2-Terminus16
FONT_MAP=
EOD

    ln -s /usr/share/zoneinfo/$SYSTEM_TIMEZONE /etc/localtime

    hwclock --systohc --utc
}

setupNetwork () {
    echo $SYSTEM_HOST > /etc/hostname
    systemctl enable dhcpcd@${NETWORK_IFACE}.service
    iw dev
    pause "Press any key to setup wifi..."
}

setupInitramdisk () {
    echo 'COMPRESSION="xz"' >> /etc/mkinitcpio.conf
    mkinitcpio -p linux
}

setupBootloader () {
    pacins grub-bios
    grub-install --target=i386-pc --recheck $BOOT_DISK
    cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
    grub-mkconfig -o /boot/grub/grub.cfg
}

##### C O N F I G #####

performConfig () {
    clear

    # Install useful packages
    pacrem s-nail jfsutils nano pcmciautils reiserfsprogs xfsprogs
    pacupg
    pacins linux-lts linux-lts-headers ${SYSTEM_CHIP}-ucode reflector sudo iptables colordiff \
        bash-completion fdupes rsync net-tools xz openssh ntfs-3g

    # Load the 'microcode' module
    echo microcode >/etc/modules-load.d/microcode.conf

    # Add linux-lts entry in grub
    grub-mkconfig -o /boot/grub/grub.cfg
    # TODO Adjust default option
 
    updateMirrors
    createUser

    curl -O ${WEB_FILES}/iptables.sh
    chmod +x ./iptables.sh
    sudo ./iptables.sh 
    rm -f ./iptables.sh

    # Configuration as the system user
    chown $SYSTEM_USER:users /install.sh
    # su don't allow ttys to input password
    sudo -i -u $SYSTEM_USER /install.sh user
}

updateMirrors () {
    mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist~
    reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist
    pac -Syy
    pacupg
}

createUser () {
    # Add a user
    useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner,network \
        -s /bin/bash $SYSTEM_USER
    echo && echo "Enter '$SYSTEM_USER' password:"
    passwd $SYSTEM_USER

    subs '# %wheel ALL=(ALL) ALL' '%wheel ALL=(ALL) ALL' /etc/sudoers
}

##### U S E R #####

performUserConfig () {
    [ $VBOX == true ] && setupVbox

    setupSound
    installX
    installAur
    installKde
    installTools
    installDevel
    installJava
    setupShell

    sudo reboot
}

setupVbox () {
    spacins virtualbox-guest-utils virtualbox-guest-modules-lts
    sudo bash -c 'cat >>/etc/modules-load.d/virtualbox.conf' <<EOD
vboxguest
vboxsf
vboxvideo
EOD
    sudo depmod
    sudo modprobe vboxguest vboxsf vboxvideo
    sudo gpasswd -a $SYSTEM_USER vboxusers
}

setupSound () {
    spacins alsa-utils alsa-oss
    echo && echo "ALSAMIXER: To unmute channels press 'M' and set a proper value"
    pause "Press any key to execute 'alsamixer'"
    alsamixer 
    speaker-test -l2 -c2 -Ddefault -twav
    sudo alsactl -f /var/lib/alsa/asound.state store
    # Edit rc.conf (add 'alsa' to daemons)
}

installX () {
    # Install X
    spacins xorg-server xorg-xinit xorg-server-utils xorg-twm xorg-xclock xterm $XDRIVER

    #sudo modprobe $XDRIVER_MODULE

    # Fix the keyboard layout (write 10-keyboard.conf)
    sudo bash -c 'cat >>/etc/X11/xorg.conf.d/10-keyboard.conf' <<EOD
Section "InputClass"
    Identifier         "Keyboard Defaults"
    MatchIsKeyboard	   "yes"
    Option	           "XkbLayout" "$KB_LAYOUT"
EndSection
EOD

    echo "Xorg: Check the Xorg setup, specially the keyboard layout"
    pause "Press any key to start X. To continue exit all xterms"
    startx # TEST

    # Remove xterm, twm, unused fonts, etc.
    spacrem xorg-twm xorg-xclock xterm

    # Install fonts
    spacins ttf-dejavu ttf-bitstream-vera ttf-cheapskate ttf-freefont \
        ttf-linux-libertine ttf-inconsolata ttf-liberation ttf-ubuntu-font-family
}

installAur () {
    # Add repo to /etc/pacman.conf
    sudo bash -c 'cat >>/etc/pacman.conf' <<EOD
[archlinuxfr]
SigLevel = Optional TrustAll
Server = http://repo.archlinux.fr/\$arch
EOD
    spac -Syy
    spacins yaourt namcap
}

installKde () {
    spacins kde-meta-kdeadmin kde-meta-kdeartwork kde-meta-kdebase kde-meta-kdegraphics \
        kde-meta-kdemultimedia kde-meta-kdeplasma-addons kde-meta-kdeutils \
        kdeplasma-applets-plasma-nm k3b phonon-vlc ktorrent smplayer kwebkitpart \
        gtk-theme-switch2

    # TODO Use gtk-theme-switch2 command line to set GTK oxigen theme using the command line

    # Create desktop directories
    mkdir -p ~/Desktop ~/.kde4/Autostart ~/Documents ~/Downloads ~/Videos ~/Pictures ~/Music \
        2>/dev/null

    # Disable akonadi
    #subs 'StartServer=true' 'StartServer=false' '~/.config/akonadi/akonadiserverrc'

    pause 'Press any key to install KDM service'
    sudo systemctl enable kdm.service
}

installTools () {
    spacins \
        firefox chromium flashplugin blender gimp inkscape \
        gvim htop p7zip yakuake calibre nmap wget \
        libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-en-US \
        libreoffice-es libreoffice-kde4 xcursor-vanilla-dmz oxygen-gtk2 virtualbox \
        virtualbox-host-modules kaffeine
}

installDevel () {
    spacins python python-docs python2 python2-docs ruby ruby-docs graphviz git \
        nodejs subversion doxygen
}

installJava () {
    yaourt -S jdk jdk-docs
    spacins scala scala-docs groovy groovy-docs apache-ant maven \
        intellij-idea-community-edition
    yaourt -S gradle
}

setupShell () {
    fetchFile 'bash_profile'
    fetchFile 'bashrc'
    fetchFile 'inputrc'
    fetchFile 'gvimrc'
    fetchFile 'vimrc'
}

fetchFile () {
    mv ~/.$1 ~/.$1~
    curl "${WEB_FILES}/$1" >~/.$1
}

# I N S T A L L ###############################################################################
#
# INTERNAL
#
if [ "$1" == "chroot" ]; then
    performChroot
fi
if [ "$1" == "user" ]; then
    performUserConfig
fi

# TODO Post install cleanup: delete tty1.service~, modify akonadiserverrc...
# TODO Don't load X driver when installing in VBox
# TODO Find *~ files *.pac* files and check logs
#
# PUBLIC
#
if [ "$1" == "install" ]; then
    performInstall
fi
if [ "$1" == "config" ]; then
    performConfig
fi

