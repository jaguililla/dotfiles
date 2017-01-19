#!/usr/bin/env bash

echo "<<<<<< EXECUTING VIRTUALBOX.SH >>>>>>"

yum -q -y install dkms kernel-devel-$(uname -r)
yum -q -y clean all

mkdir ~/virtualbox
mount -o ro,loop /home/vagrant/vboxga.iso ~/virtualbox
~/virtualbox/VBoxLinuxAdditions.run
umount ~/virtualbox

rm -rf ~/virtualbox /home/vagrant/vboxga.iso

lsmod|awk '{ print $1 }'|grep vb|cat >>/etc/modules-load.d/virtualbox.conf

cat /etc/modules-load.d/virtualbox.conf
