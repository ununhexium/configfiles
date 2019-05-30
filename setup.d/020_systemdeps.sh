echo "Installing system dependencies"

sudo apt install -y \
    arandr \
    compton \
    curl \
    dunst \
    entr \
    flameshot \
    glances \
    gource \
    htop \
    imagemagick \
    kdiff3 \
    python3 \
    python3-pip \
    ranger \
    redshift-gtk \
    rofi \
    terminator \
    tree \
    unclutter \
    vim-gui-common \
    vim-runtime \
    virtualbox-6.0 \
    xterm \
    zsh

sudo chsh --shell /usr/bin/zsh

