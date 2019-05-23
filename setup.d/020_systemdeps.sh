echo "Installing system dependencies"

sudo apt install -y \
    compton \
    curl \
    dunst \
    entr \
    flameshot \
    glances \
    gource \
    htop \
    python3 \
    python3-pip \
    redshift-gtk \
    rofi \
    tree \
    unclutter \
    vim-gui-common \
    vim-runtime \
    virtualbox-6.0 \
    zsh

sudo chsh --shell /usr/bin/zsh

