#!/bin/sh
set -u
svn_url=$1
svn log --stop-on-copy -q $svn_url | tail -n 2 | head -n 1 | awk '{print $1}'|sed -e 's/r\(.*\)/\1/g'
