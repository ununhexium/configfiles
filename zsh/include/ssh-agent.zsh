if command -v ssh-agent >/dev/null 2>&1; then

  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
      ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
  fi

  if [ ! -f "$SSH_AUTH_SOCK" ]; then
      source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
  fi
else
  echo "ssh-agent is not installed. Skipping config"
fi

