
function cargoi() {
    for var in "$@"; do
        cargo install --list | grep "$var" || cargo install "$var"
    done
}   

echo "Installing rust dependencies"

command cargo || curl https://sh.rustup.rs -sSf | sh -s -- -y || exit 1

source "$HOME/.cargo/env"

cargoi \
    fd-find \
    lsd \
    ripgrep


