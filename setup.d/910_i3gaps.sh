
echo "Installing i3gaps"

sudo apt install -y \
    libxcb1-dev\
    libxcb-keysyms1-dev\
    libpango1.0-dev\
    libxcb-util0-dev\
    libxcb-icccm4-dev\
    libyajl-dev\
    libstartup-notification0-dev\
    libxcb-randr0-dev\
    libev-dev\
    libxcb-cursor-dev\
    libxcb-xinerama0-dev\
    libxcb-xkb-dev\
    libxkbcommon-dev\
    libxkbcommon-x11-dev\
    autoconf\
    xutils-dev\
    libtool\
    automake


# xcb-util-xrm
clone https://github.com/Airblader/xcb-util-xrm
cd "$HOME/dev/Airblader/xcb-util-xrm"
git submodule update --init

./autogen.sh --prefix=/usr

make
sudo make install


# i3 gaps

clone https://www.github.com/Airblader/i3
cd "$HOME/dev/Airblader/i3"
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build

../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install


