#!/usr/bin/env bash

#
# References:
# www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-centos-7-servers
#
# The boxes still must follow the next instructions to create a user:
# www.digitalocean.com/community/tutorials/initial-server-setup-with-centos-7
#

# Disable rankmirror (poor performance)
sed -i~ "s/enabled=1/enabled=0/g" /etc/yum/pluginconf.d/fastestmirror.conf

echo "/etc/yum/pluginconf.d/fastestmirror.conf"
cat /etc/yum/pluginconf.d/fastestmirror.conf

# SELinux 'permissive' mode
setenforce 0
sed -i~ "s/SELINUX=enforcing/SELINUX=permissive/g" /etc/selinux/config

sestatus

# Add swap
dd if=/dev/zero of=/swapfile bs=1M count=1024 status=none
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sh -c 'echo "/swapfile swap swap sw 0 0" >> /etc/fstab'

free

# Install infrastructure
yum -q -y update 2>/dev/null
yum -q -y install epel-release 2>/dev/null
yum -q -y install git ntp htop vim wget zip unzip 2>/dev/null
yum -q -y install java-1.8.0-openjdk-devel 2>/dev/null
yum -q -y clean all

git version
ntpd -!
htop -v
vim --version
wget -V
java -version

# Start base services
systemctl start ntpd
systemctl enable ntpd
systemctl start firewalld
systemctl enable firewalld

systemctl status ntpd
systemctl status firewalld

# Timezone
timedatectl

# Setup shell (files taken from GH to be able to reuse this script in other Vagrant boxes)
GH_PROJECT="https://raw.githubusercontent.com/jaguililla/dotfiles"
wget "$GH_PROJECT/master/vagrant/centos_java/bashconfig" -O ~/.bashconfig 2>/dev/null
wget "$GH_PROJECT/master/vagrant/centos_java/inputrc" -O ~/.inputrc 2>/dev/null

echo -e "\nsource .bashconfig\n" >>~/.bashrc

echo "~/.bashconfig"
cat ~/.bashconfig
echo "~/.bashrc"
cat ~/.bashrc
