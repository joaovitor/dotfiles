#!/bin/sh

dotfiles_basedir=$1

for i in `find ${dotfiles_basedir}/dotfiles/ -maxdepth 1`; do
  echo $i;
  original_file=`basename $i`
  ln -snfv $i .${original_file}
done
