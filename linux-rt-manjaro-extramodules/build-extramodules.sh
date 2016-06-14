#!/bin/bash

pwd=`pwd`

if [ "`sudo cat /etc/sudoers | grep pacman`" == "" ] ; then
   echo "please add '`whoami` ALL=NOPASSWD: /usr/bin/pacman' to your /etc/sudoers file"
   exit 1
fi

echo 'cleaning environment'
rm -R ${pwd}/*/{src,pkg} -f
echo 'building extramodules'
cd ${pwd}/*acpi_call && makepkg --sign -sf --noconfirm
cd ${pwd}/*bbswitch && makepkg --sign -sf --noconfirm
cd ${pwd}/*broadcom-wl && makepkg --sign -sf --noconfirm
cd ${pwd}/*catalyst && makepkg --sign -df --noconfirm
cd ${pwd}/*ndiswrapper && makepkg --sign -sf --noconfirm
cd ${pwd}/*nvidia && makepkg --sign -sf -d --noconfirm
cd ${pwd}/*nvidia-304xx && makepkg --sign -d --noconfirm
cd ${pwd}/*nvidia-340xx && makepkg --sign -d --noconfirm
cd ${pwd}/*nvidiabl && makepkg --sign -sf --noconfirm
cd ${pwd}/*open-vm-tools-modules && makepkg --sign -sf --noconfirm
cd ${pwd}/*spl_zfs && makepkg --sign -sf --noconfirm
cd ${pwd}/*r8168 && makepkg --sign -sf --noconfirm
cd ${pwd}/*rt3562sta && makepkg --sign -sf --noconfirm
cd ${pwd}/*tp_smapi && makepkg --sign -sf --noconfirm
cd ${pwd}/*vhba-module && makepkg --sign -sf --noconfirm
cd ${pwd}/*virtualbox-modules && makepkg --sign -sf --noconfirm
echo 'create repo'
mkdir -p ${pwd}/repo-`uname -m`
mv ${pwd}/*/*`uname -m`.pkg* ${pwd}/repo-`uname -m`
ls ${pwd}/repo-`uname -m`
echo 'building extramodules done'
