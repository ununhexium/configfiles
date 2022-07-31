source /usr/share/zsh-antigen/antigen.zsh

source ~/.zshrc.d/user.zsh
source ~/.zshrc.d/ansible.zsh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_OFFLINE_MODE=false
