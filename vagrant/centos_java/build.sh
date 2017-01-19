#!/usr/bin/env bash

VBOXVER="5.1.14"                                                                                     
VBOXDL="http://download.virtualbox.org/virtualbox"
wget -nc -O vboxga.iso "$VBOXDL/$VBOXVER/VBoxGuestAdditions_$VBOXVER.iso"

vagrant up
vagrant package

