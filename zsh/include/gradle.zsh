function gra {
  GRADLE=

  if [[ -e './gradlew' ]]
  then
    GRADLE='./gradlew'
  else
    GRADLE='gradle'
  fi


  if [[ "$1" = 'fzf' ]]
  then
    task=$("$GRADLE" tasks | fzf | cut -d ' ' -f 1)
    echo "$GRADLE" "$task"
    "$GRADLE" "$task"
  else
    "$GRADLE" "$@"
  fi
}

