#!/bin/bash

for pkg in $(ls */PKGBUILD | sed s'|/PKGBUILD||g') ; do
   echo "Edit ${pkg}"
   pushd ${pkg} &>/dev/null
   _rel=$(cat PKGBUILD | grep pkgrel= | cut -d= -f2 | head -n1)
   sed -i -e "s/pkgrel=${_rel}/pkgrel=$((${_rel}+1))/" PKGBUILD
   popd &>/dev/null
done
