
echo "Installing python dependencies"

pip3 install pipsi || exit 1


function pipsii() {
    python3=$(which python3)
    for var in "$@"; do
        pipsi install --python "$python3" "$var" || exit 1
    done
}   

pipsii \
    thefuck \
    tldr

