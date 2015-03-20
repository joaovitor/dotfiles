#!/bin/sh

function classesfromjar() {
	local jar_path="$1"
	local file=$(basename $jar_path)
	local content_file="/tmp/${file/jar/txt}"
	unzip -l $jar_path > "$content_file"

	for i in $(awk '{print $4}' $content_file |grep class);	do
		echo $(echo "$i"|sed -e 's/\.class//g;s/\//\./g')
	done
	rm -f "${content_file}"
}

function jarusage() {
	local jar_path="$1"
	local verbose="$2"

	if [ -z "$verbose" ]; then
	  verbose='N'
	fi

	for class in $(classesfromjar "$jar_path"); do
		if $(git grep -q "${class}" -- *.java) ; then
			local ocurrences=$(git grep -l "${class}" -- *.java | wc -l | awk '{print $1}')
			echo "${class} - ${ocurrences}"
			if [ "$verbose" = 'Y' ]; then
				echo ""
				git --no-pager grep -l "${class}" -- *.java
				echo ""
			fi
	    fi
	done
}
