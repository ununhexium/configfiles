# Ctrl + ->
bindkey "^[[1;5C" forward-word
# Ctrl + <-
bindkey "^[[1;5D" backward-word
# Delete
bindkey '^[[3~' delete-char
# Home
bindkey '^[[H' beginning-of-line
# End
bindkey '^[[F' end-of-line

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

