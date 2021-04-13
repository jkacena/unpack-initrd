#!/bin/sh

if [ "$1" = "" ] || [ "$3" != "" ] ; then
  echo "Usage: $0 initrd.img [directory]"
  exit 1
fi
      
if [ "$2" = "" ] ; then
  DIR="$1-cpio"
else
  DIR=$2
fi
test -e $DIR || mkdir $DIR
if [ ! -d $DIR ] ; then
  echo "Not a directory: $DIR"
  exit 1
fi
FN=`realpath $1`
cd $DIR
zcat $FN | cpio -i --no-absolute-filenames
