#!/bin/sh

# Execute a command on every subdirectory, from a given depth, that matches the filter.
#
# Sample usage:
#     exec-command.sh "git st -s" 2 ".git"

command=$1
depth=$2
filter=$3

if [ -z "$depth" ]; then
  depth=1
fi

if [ -z "$filter" ]; then
  filter=""
fi

echo "$command";

for i in `find . -maxdepth $depth \( -type d -o -type l \) -not -name '.' | egrep -v '\.(git|svn)' `; do 
  if [ -d "$i/$filter" ] ; then
    echo "$i";
    (
      cd "$i";
      eval "$command";
    )
  fi
done
