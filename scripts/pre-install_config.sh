#!/bin/bash

clear
echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
#echo "Updating Keyrings..."
echo "Updating Installer Files..."
sleep 2s
#pacman -Sy --needed --noconfirm archlinux-keyring
pacman -Syy
sleep 15s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
echo "Enabling NTP service."
timedatectl set-ntp true
sleep 3s
timedatectl
sleep 10s
clear

exec /arc-os/scripts/disk-config.sh