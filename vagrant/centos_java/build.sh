#!/usr/bin/env bash

vagrant box remove centos_java

vagrant up
vagrant package
vagrant box add --name centos_java package.box

#vagrant destroy -f
rm package.box
