
mark=$(cat "$HOME/.backup/setup/.lastmark")
bkpdir="$HOME/.backup/setup/$mark"


function backup() {
    name="$(echo $1 | sed -e 's#/#_#g')"
    archive="$bkpdir/$name"
    if [ -e $1 ]; then
        echo "Archiving $1 to $archive"
        mv "$1" "$archive"
    fi
}

# Backup and Link
function bnl() {
    dst="$HOME/$1"
    src="$SCRIPTPATH/$1"
    if [ -e "$SCRIPTPATH/$1" ]; then
        if [ -L "$dst" -a $(readlink -f "$dst") = "$src" ]; then
            echo "Skip replacement of $dst, it is already the right target"
        else
            if [ -e $1 ]; then
                echo "Backup $1 to $dst"
                backup "$dst"
                echo "Linking $src to $dst"
                ln -s "$src" "$dst"
            fi
        fi
    fi

}


