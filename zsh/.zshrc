if ! xset q &>/dev/null; then
  echo "No Xorg running, setting font..."
  setfont ter-132n
fi

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

source /home/uuh/.config/broot/launcher/bash/br

