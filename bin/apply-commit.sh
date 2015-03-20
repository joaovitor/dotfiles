#!/bin/sh
set -u

start_commit=$1
end_commit=$2
dest_dir=$3

# git diff $start_commit..$end_commit --name-status

echo "copiando as modificações e adições"
for i in `git diff $start_commit..$end_commit --name-status --diff-filter=AM|awk '{print $2}'`; do
  echo $i;
  dir_path=$(dirname $i);
  mkdir -pv "$dest_dir/$dir_path";
  cp -v $i "$dest_dir/$i";
done

echo "apagando os arquivos removidos"
for i in `git diff $start_commit..$end_commit --name-status --diff-filter=D|awk '{print $2}'`; do
  rm -v "$dest_dir/$i";
done