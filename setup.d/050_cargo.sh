
function cargoi() {
    for var in "$@"; do
        cargo install --list | grep "$var" || cargo install "$var"
    done
}   

echo "Installing rust dependencies"

command cargo || curl https://sh.rustup.rs -sSf | sh -s -- -y || exit 1

cargoi \
    fd-find \
    lsd \
    ripgrep

source "$HOME/.cargo/env"

