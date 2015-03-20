#!/bin/sh
task_number=$1
for i in `git log --oneline --grep="^$task_number"|awk '{print $1}'`; do 
  git diff-tree --no-commit-id --name-only -r $i;
done|sort -u
