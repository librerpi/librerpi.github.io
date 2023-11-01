#!/bin/sh
# SPDX-License-Identifier: GPL-3.0+
#
# Copyright (C) 2021-2023, Ferass El Hafidi <vitali64pmemail@protonmail.com>

usage() {
	echo "Usage: $0 [clear]"
}

if [ "$1" = "clear" ]; then
	echo "Removing generated website..."
	rm -rf www/*
	exit 0
elif [ ! -n "$1" ]; then
	: # Continue
else
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
	echo "<details class=\"winList\">"
	echo "<summary>List of pages</summary>"
	echo "<ul class=\"list\">"
	echo "<li class=\"winListClose\"><button " \
		"onclick=\"document.querySelector('.winList')" \
		".removeAttribute('open')\">Close</button></li>"
	echo "<li><h3 style=\"margin: 5px;\">Page list</h3></li>"
	echo "<li><a href=\"/index.html\">Home</a></li>"
	for filelink in ${docs}; do
		name="$(head -1 docs${filelink}.md)"
		[ "${filelink}" != "/index" ] && \
			echo "<li><a href=\"${filelink}.html\">${name}</a></li>"
	done
	echo "</ul>"
	echo "</details>"
}

mkdir -p "www/img"
cp img/* "www/img/"

for file in ${docs}; do
	header > "www/${file}.html"
	list >> "www/${file}.html"
	echo "<div class=\"content\">" >> "www/${file}.html"
	markdown "docs/${file}.md" | \
		sed 's_^<h\([123]\)>\(.*\)</h\1>_<h\1 id="\2">\2</h\1>_' \
		>> "www/${file}.html"
	echo "</div>" >> "www/${file}.html"
	footer >> "www/${file}.html"
	printf "<code>\nHEAD: " >> "www/${file}.html"
	git log --pretty=%H -n 1 >> "www/${file}.html"
	echo "</code>" >> "www/${file}.html"
done
