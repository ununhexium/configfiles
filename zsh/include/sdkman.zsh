## SDK Man

if [[ -z "$SDKMAN_DIR" ]] ; then

  export SDKMAN_DIR="$HOME/.sdkman"
  #[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  export SDKMAN_OFFLINE_MODE=false

  # SDK Man takes 100ms to start wwith ZSH. This is a workaround to speed up ZSH's startup time
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo 'Skipping SDK Man init, already initialized'
fi
