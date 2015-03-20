#!/bin/sh
task_number=$1
for i in `git log --oneline --grep="\[$task_number\]"|awk '{print $1}'`; do 
  git show $i;
done
