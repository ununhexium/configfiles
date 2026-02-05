
#export NVM_DIR="$HOME/.config/nvm"

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Arch-installed nvm + workaround to not load nvm on each new ZSH startup (500ms)
alias nvm='unalias nvm; source "/usr/share/nvm/init-nvm.sh"; nvm'
