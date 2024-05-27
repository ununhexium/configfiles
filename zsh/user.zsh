# Powerline 10k

source "$ZDOTDIR/p10k.zsh"


# Custom scripts
export PATH="$PATH:$HOME/.local/scripts:$HOME/.local/bin"

#antigen theme romkatv/powerlevel10k

#antigen bundle mvn
#antigen bundle "greymd/docker-zsh-completion"
#antigen bundle unixorn/fzf-zsh-plugin@main
#antigen bundle zsh-users/zsh-autosuggestions

plugins=(
    zsh-autosuggestions
)

autoload -U compinit; compinit
compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
#zstyle ':completion:*:mvn:*' show-all-phases true
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
zstyle ':completion:*'            menu select

# allow comments in commands
setopt interactivecomments

#antigen apply

# General linux

export TMP=/tmp/$USER
if [ ! -d "$TMP" ]; then mkdir "$TMP"; fi

export LESS="-j.5 -R --hilite-unread --use-color --color=Sr"

export EDITOR=nvim
export VISUAL=vim
export PAGER='less'

# MORE!
for f in $(ls "$ZDOTDIR/include")
do
    source "${ZDOTDIR}/include/$f"
done

#  ## ANDROID
#  
#  export ANDROID_HOME="$HOME/Android/Sdk"
#  export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
#  export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"
#  
#  
#  ## FLUTTER
#  
#  export PATH="$PATH:$HOME/app/flutter/current/bin"


# FUCK IT! >_<
fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}

function echopath {
	echo $PATH | sed -e "s/:/\n/g"
}

#  ## GO
#  
#  export GOPATH="$HOME/go"
#  export PATH="$PATH:$HOME/app/go/current/bin:$GOPATH/bin"
#  
#  ## Go Buster
#  
#  export PATH="$PATH:$HOME/app/gobuster/current/"
#  
#  ## JAVA
#  
#  ### jclasslib
#  
#  export PATH="$PATH:/home/uuh/app/jclasslib/current/bin"
#  
#  
#  ## MDV
#  export MDV_THEME="884.0134"
#  
#  
#  ## NPM, NVM, Node JS
#  
#  NPM_PACKAGES="${HOME}/.npm-packages"
#  export PATH="$PATH:$NPM_PACKAGES/bin"
#  
#  export NVM_DIR="$HOME/.nvm"
#  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#  
#  
#  ## PERL
#  
#  PATH="/home/uuh/perl5/bin${PATH:+:${PATH}}"; export PATH;
#  PERL5LIB="/home/uuh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#  PERL_LOCAL_LIB_ROOT="/home/uuh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#  PERL_MB_OPT="--install_base \"/home/uuh/perl5\""; export PERL_MB_OPT;
#  PERL_MM_OPT="INSTALL_BASE=/home/uuh/perl5"; export PERL_MM_OPT;
#  
#  
#  ## RUBY
#  
#  export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"


source "${ZDOTDIR}/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
source "${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=#808080,bold'
source "${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
