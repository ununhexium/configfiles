
mark=$(cat "$HOME/.backup/setup/.lastmark")
bkpdir="$HOME/.backup/setup/$mark"


function backup() {
    name="$(echo $1 | sed -e 's#/#_#g')"
    archive="$bkpdir/$name"
    echo "Archiving $1 to $archive"
    mv "$1" "$archive"
}   

# Backup and Link
function bnl() {
    dst="$HOME/$1"
    src="$SCRIPTPATH/$1"
    if [ -e "$SCRIPTPATH/$1" ]; then
        if [ -L "$dst" -a $(readlink -f "$dst") = "$src" ]; then
            echo "Skip replacement of $dst, it is already the right target"
        else
            echo "Backup $1 to $dst"
            backup "$dst"
            echo "Linking $src to $dst"
            ln -s "$src" "$dst"
        fi
    fi

}


