
# Ctrl + ->
bindkey "^[[1;5C" forward-word
# framebuffer
#bindkey "^[[C" forward-word

# Ctrl + <-
bindkey "^[[1;5D" backward-word
# framebuffer
#bindkey "^[[D" backward-word

# Delete
bindkey '^[[3~' delete-char

# Home
bindkey '^[[H' beginning-of-line
bindkey '^A' beginning-of-line
# framebuffer
bindkey '^[[1~' beginning-of-line

# End
bindkey '^[[F' end-of-line
bindkey '^E' end-of-line
# framebuffer
bindkey '^[[4~' end-of-line

# Backspace
bindkey '^?' backward-delete-char


autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

