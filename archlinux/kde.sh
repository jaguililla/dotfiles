#!/usr/bin/env bash

sudo pacman -S \
  yakuake \
  kaccounts-providers \
  ksshaskpass \
  kwallet-pam \
  kcmutils \
  sddm-kcm \
  sddm

sudo systemctl -f enable sddm
