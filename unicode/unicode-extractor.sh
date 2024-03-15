#!/usr/bin/env zsh


# Data source
# https://unicode.org/ucd/
#

src='https://www.unicode.org/Public/14.0.0/ucdxml/ucd.all.flat.zip'
dir='/dev/shm/emoji-tmp'
[[ -d "$dir" ]] || mkdir -p "$dir"
zip="$dir/unicode.zip"
xml="$dir/ucd.all.flat.xml"
dst="$dir/emoji"
target="$XDG_DATA_HOME/emoji"

[[ -e "$zip" ]] || curl "$src" --output "$zip"
[[ -e "$xml" ]] || unzip -o "$zip" -d "$dir"


# What do you say? Can't parse XML with regexes? Sorry, I didn't know :3
cat "$xml" | grep -v '<block first-cp' | grep -v 'standardized-variant' | grep -v 'emoji-source' | grep -P "$(cat "$xml" | grep -P 'emoji.*unicode="[0-9a-fA-F]+"' | sed -re 's/.*unicode="([0-9a-fA-F]{4,5})".*/cp=\\"\1\\"/' | xargs echo -n | tr ' ' \|)" | sed -re 's/<char.*cp="(.{4,5})".* na="([^"]+?)".*/\1 \2/' | sed -re 's/ +/ /' > "$dst"

echo '' > "$target"
IFS=$'\n'
for l in $(cat "$dst")
do
  hexa=$(echo "$l" | cut -d' ' -f2)
  name=$(echo "$l" | cut -d' ' -f2 --complement)
  format=$(printf '\U%08x\n' "0x$hexa")
  printf "$format %s\n" "$name" >> "$target"
done

head "$dst"
head "$target"

