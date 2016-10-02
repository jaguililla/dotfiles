#!/usr/bin/env bash

echo "<<<<<< EXECUTING VIRTUALBOX.SH >>>>>>"

yum -q -y install dkms kernel-devel
yum -q -y clean all

mkdir ~/virtualbox
VBOXVER="5.1.6"
VBOXDL="http://download.virtualbox.org/virtualbox"
wget -nv -O ~/vboxga.iso "$VBOXDL/$VBOXVER/VBoxGuestAdditions_$VBOXVER.iso"

mount -o loop ~/vboxga.iso ~/virtualbox
~/virtualbox/VBoxLinuxAdditions.run
umount ~/virtualbox

rm ~/vboxga.iso
rm -rf ~/virtualbox

lsmod|grep vb|cat
