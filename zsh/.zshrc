
source "${ZDOTDIR}/powerlevel10k/powerlevel10k.zsh-theme"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source "${ZDOTDIR}/user.zsh"
#source ~/.zshrc.d/pyenv.zsh
#source ~/.zshrc.d/nvm.zsh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_OFFLINE_MODE=false




# Load Angular CLI autocompletion.
#source <(ng completion script)

# To customize prompt, run `p10k configure` or edit ~/.zshrc.d/p10k.zsh.
#[[ ! -f ~/.zshrc.d/p10k.zsh ]] || source ~/.zshrc.d/p10k.zsh

#source /home/uuh/.config/broot/launcher/bash/br


