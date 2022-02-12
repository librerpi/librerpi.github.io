#!/bin/sh
#	learn, a simple website documentation generator
#
#	Copyright 2021, Vitali64 <vitali64pmemail@protonmail.com>
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#	Please see the LICENSE file for more details.
usage() {
	echo "Usage		: ./learn.sh [OPTIONS]"
	echo "--help	: prints this help message"
	echo "--clear	: remove generated website"
	echo "--license	: prints the license"
}
if [ "$1" = "--help" ]; then
	usage
	exit 0
elif [ "$1" = "--clear" ]; then
	echo "[INFO] Removing generated website ..."
	rm -rf www/*
	exit 0
elif [ "$1" = "--license" ]; then
	cat LICENSE
	exit 0
elif [ "$1" = "" ]; then
	echo "learn, a simple website documentation generator"
else
	echo "[ERROR] INVALID OPTION"
	usage
	exit 1
fi
# Insert header
header() {
	cat "templates/header.html"
}
# Insert footer
footer() {
	cat "templates/footer.html"
}
docs="$(cd docs/ && find ./*.md ./*/*.md|sed -e 's/\.md//' -e 's/.//')"
list() {
	printf "		<div class=list><h5>List</h5>"
	for filelink in ${docs}
	do
		name="$(head -1 docs${filelink}.md)"
		echo   "			<li><a href=\"${filelink}.html\">${name}</a></li>"
	done
	printf "		</div>"
}
for file in ${docs}
do
	header > "www/${file}.html"
	list >> "www/${file}.html"
	printf "		<div class=\"content\">" >> "www/${file}.html"
	markdown "docs/${file}.md" | sed -e 's_^<h\([123]\)>\(.*\)</h\1>_<div class="h"><h\1 id="\2">\2</h\1><a aria-hidden="true" href="#\2">#</a></div>_' >> "www/${file}.html" #|sed -e 's@<h1>@<h1><a href="#?">@g' -e 's@</h1>@</a></h1>@g' >> "www/${file}.html"
	printf "		</div>" >> "www/${file}.html"
	footer >> "www/${file}.html"
done
