#!/bin/sh

if [ "$1" = "" ] || [ "$3" != "" ] ; then
  echo "Usage: $0 directory [initrd.img]"
  exit 1
fi
      
if [ "$2" = "" ] ; then
  FN="$1"
  FN=${FN%-cpio}
else
  FN=$2
fi
if [ ! -d $1 ] ; then
  echo "$1 is not a directory"
  exit 1
fi
if [ -e $FN -a -d $FN ] ; then
  echo "$FN is a directory"
  exit 1
fi
touch $FN
FN=`realpath $FN`
cd $1
find . | cpio --create --format='newc' | gzip > $FN
