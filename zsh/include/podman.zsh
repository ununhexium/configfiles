# For testcontainers

if pacman -Q | grep podman > /dev/null; then
  echo 'Enabling podman setup (not podman itself)'
  export DOCKER_HOST='unix:///run/user/1000/podman/podman.sock'
  export DOCKER_SOCK='/run/user/1000/podman/podman.sock'
  export TESTCONTAINERS_RYUK_DISABLED=true
  alias docker='podman'
  alias docker-compose='podman-compose'
  alias p='podman'
fi

