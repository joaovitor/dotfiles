#!/bin/sh

E_OPTERROR=85

set -u

err() {
  echo "$@" >&2
}

log() {
  echo "$@"
}

usage() {
read -d '' help <<- EOF
USAGE:
    `basename $0` OPTIONS
OPTIONS:
-r svn revision (optional) default last copied revision
-f full history flag - default false (optional)
-d dir_path (optional)
-l svn_url
EOF
	err "$help"
	exit $E_OPTERROR # Exit and explain usage.
}

main() {
	local parameters="fr:d:u:p:l:"
	if ( ! getopts "${parameters}" opt); then
		usage
	fi

	local revision=""
	local full=false
	local svn_url=""
	local dir_path=""

	while getopts "${parameters}" opt; do
	  case $opt in
	    r)
		  revision=$OPTARG
	      ;;
	    f)
		  full=true
	      ;;
	    l)
		  svn_url=$OPTARG
	      ;;
	    d)
		  dir_path=$OPTARG
	      ;;
	    \?)
	      err "Invalid option: -$OPTARG"
	      usage
	      ;;
	    :)
	      err "Option -$OPTARG requires an argument."
	      usage
	      ;;
	  esac
	done

	shift $((OPTIND-1))

	local svn_command="svn log -r 1:HEAD -l 1 -q "

	if [ -z $svn_url ] ; then
		usage
	fi

	if [ -z $dir_path ] ; then
		dir_path=`echo $svn_url|sed -e 's/.*\/\(.*\)/\1/g'`
	fi

	if [ "$full" = false ]; then
		svn_command="${svn_command} --stop-on-copy"
	fi

	if [ -z $revision ] ; then
		revision=`$svn_command $svn_url | tail -n 2 | head -n 1 | awk '{print $1}'|sed -e 's/r\(.*\)/\1/g'`
	fi

	git svn clone -r $revision $svn_url $dir_path

	(	
		cd $dir_path;
		git svn rebase
	)
	(
		cd $dir_path;
		git config --add branch.master.remote . ;
		git config --add branch.master.merge refs/remotes/git-svn;
	)
}

main $@
