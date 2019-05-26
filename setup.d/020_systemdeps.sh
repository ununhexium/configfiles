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
    python3 \
    python3-pip \
    ranger \
    redshift-gtk \
    rofi \
    tree \
    unclutter \
    vim-gui-common \
    vim-runtime \
    virtualbox-6.0 \
    zsh

sudo chsh --shell /usr/bin/zsh

