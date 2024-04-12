function take {
    mkdir -p "$1"
    cd "$1"
}

function gra {
  if [[ -e './gradlew' ]]
  then
    ./gradlew "$@"
  else
    gradle "$@"
  fi
}
