#!/usr/bin/env bash

#
# References:
# www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-centos-7-servers
#
# The boxes still must follow the next instructions to create a user:
# www.digitalocean.com/community/tutorials/initial-server-setup-with-centos-7
#

echo "<<<<<< EXECUTING SETUP.SH >>>>>>"

# Install infrastructure
yum -q -y update
yum -q -y install epel-release
yum -q -y install git ntp htop vim wget
yum -q -y install java-1.8.0-openjdk-devel
yum -q -y clean all

git version
ntpd -!
htop -v
vim --version
wget -V
java -version

# SELinux 'permissive' mode
setenforce 0
sed -i~ "s/SELINUX=enforcing/SELINUX=permissive/g" /etc/selinux/config

sestatus

# Disable rankmirror (poor performance)
sed -i~ "s/enabled=1/enabled=0/g" /etc/yum/pluginconf.d/fastestmirror.conf

echo "/etc/yum/pluginconf.d/fastestmirror.conf"
cat /etc/yum/pluginconf.d/fastestmirror.conf

# Add swap
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'

swapon

# Start base services
systemctl start ntpd
systemctl enable ntpd
systemctl start firewalld
systemctl enable firewalld

systemctl status ntpd
systemctl status firewalld

# Timezone
timedatectl set-timezone Europe/Madrid

timedatectl

# Setup shell
echo -e "\nsource .bashconfig\n" >>/home/vagrant/.bashrc

echo "/home/vagrant/.bashconfig"
cat /home/vagrant/.bashconfig
echo "/home/vagrant/.bashrc"
cat /home/vagrant/.bashrc

cp /home/vagrant/.bashconfig /root
cp /home/vagrant/.inputrc /root

