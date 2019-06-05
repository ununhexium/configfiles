echo "Install vim dependencies"

source core.sh

backup "$HOME/.vim"

mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle" && \
curl -LSso "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim || exit 1

