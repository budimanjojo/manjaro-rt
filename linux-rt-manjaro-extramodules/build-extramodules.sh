#!/bin/bash

pwd=`pwd`

if [ "`sudo cat /etc/sudoers | grep pacman`" == "" ] ; then
   echo "please add '`whoami` ALL=NOPASSWD: /usr/bin/pacman' to your /etc/sudoers file"
   exit 1
fi

echo 'cleaning environment'
rm -R ${pwd}/*/{src,pkg} -f
echo 'building extramodules'
cd ${pwd}/*acpi_call && makepkg -sf --noconfirm
cd ${pwd}/*bbswitch && makepkg -sf --noconfirm
cd ${pwd}/*broadcom-wl && makepkg -sf --noconfirm
cd ${pwd}/*catalyst && makepkg -df --noconfirm
cd ${pwd}/*ndiswrapper && makepkg -sf --noconfirm
cd ${pwd}/*nvidia && makepkg -sf -d --noconfirm
cd ${pwd}/*nvidia-304xx && makepkg -d --noconfirm
#cd ${pwd}/*nvidia-340xx && makepkg -d --noconfirm
cd ${pwd}/*nvidiabl && makepkg -sf --noconfirm
cd ${pwd}/*open-vm-tools-modules && makepkg -sf --noconfirm
#cd ${pwd}/*spl_zfs && makepkg -sf --noconfirm
cd ${pwd}/*r8168 && makepkg -sf --noconfirm
cd ${pwd}/*rt3562sta && makepkg -sf --noconfirm
cd ${pwd}/*tp_smapi && makepkg -sf --noconfirm
cd ${pwd}/*vhba-module && makepkg -sf --noconfirm
cd ${pwd}/*virtualbox-modules && makepkg -sf --noconfirm
#echo 'create repo'
#mkdir -p ${pwd}/repo-`uname -m`
#mv ${pwd}/*/*`uname -m`.pkg* ${pwd}/repo-`uname -m`
#ls ${pwd}/repo-`uname -m`
#echo 'building extramodules done'
