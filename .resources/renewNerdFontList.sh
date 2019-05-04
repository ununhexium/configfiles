#!/usr/bin/env bash

src='https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/css/nerd-fonts-generated.css'
dst="$TMP/nfraw.css"

if [ ! -f $dst ]; then
	echo "Download from $src"
	wget "$src" -O "$dst"
fi

#cat "$dst" | tr '\n' ' ' | tr \} \\n | grep '.nf-'

name_regex=".nf-(.*):before"
codepoint_regex=".*content: \"\\\\([0-9a-f]+).*"

IFS=$'\n'
for line in $(cat "$dst" | tr '\n' ' ' | tr \} \\n | grep '.nf-')
do
	if [[ $(echo "$line" | cut -d\, -f1) =~ $name_regex ]]
	then
		name="${BASH_REMATCH[1]}"
	else
		exit 1
	fi
	codepoint_part="$(echo "$line" | cut -d\, -f3)"
    if [[ "$codepoint_part" =~ $codepoint_regex ]]
    then
		codepoint="${BASH_REMATCH[1]}"
        echo -en '\u'"${codepoint}"
		echo " - ${name} - ${codepoint}"
    else
        echo "$codepoint_part doesn't match" >&2
    fi
done


