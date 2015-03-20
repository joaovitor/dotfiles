#!/bin/sh

command=$1
depth=$2

if [ -z "$depth" ]; then
  depth=1
fi

exec-command.sh "$command" "$depth" '.git'