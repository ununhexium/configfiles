# Powerline 10k

source "$HOME/.zshrc.d/p10k.zsh"


# ANTIGEN

antigen use oh-my-zsh

# Custom scripts
export PATH="$PATH:$HOME/.local/scripts:$HOME/.local/bin"

antigen theme romkatv/powerlevel10k

#antigen bundle mvn
antigen bundle "greymd/docker-zsh-completion"
antigen bundle unixorn/fzf-zsh-plugin@main

#zstyle ':completion:*:mvn:*' show-all-phases true
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

antigen apply

# General linux

export TMP=/tmp/$USER
if [ ! -d "$TMP" ]; then mkdir "$TMP"; fi

export LESS="-j.5 -R --hilite-unread --use-color --color=Sr"

# COMPLETION
## Gradle
fpath=(/home/uuh/.zsh/gradle-completion $fpath)

## custom
fpath=(~/.local/scripts/completion $fpath)


alias ai='aptinstall'
alias click="xdg-open"
alias cg='cyberghostvpn'
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias df="df -hl"
alias f="fuck"
alias g="git"
alias ikotlin="kotlinc-jvm"
alias listwifi="iwlist wlp2s0 scan"
alias la="ls -lah"
alias ll="ls -lah"
alias mvnw="./mvnw"
alias pipsi="python3 -m pipsi --home $WORKON_HOME"
alias pomodoro='while true; do notify-send Pomodoro Resume; sleep 1500; notify-send --urgency critical --expire-time 300000 Pomodoro Pause; done'
alias rlf='readlink -f'
alias sarahconnor="cd $PWD"
alias speedometer="speedometer -r $IFACE -t $IFACE"

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


## ANDROID

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"


## FLUTTER

export PATH="$PATH:$HOME/app/flutter/current/bin"


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

## FZF
export FZF_DEFAULT_OPTS='--layout=default'

## GIT
function ggo {
    cd $(fzf_ggo)
}

function gcot {
    git checkout $(git tag --list | fzf)
}

function gco() {
 git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

function dgo {
    ranger --choosedir=/tmp/dirselection
    cd $(cat /tmp/dirselection)
}

function echopath {
	echo $PATH | sed -e "s/:/\n/g"
}

## GRADLE

function gra {
    if [[ -f ./gradlew ]]
    then
        ./gradlew "$@"
    else
        gradle "$@"
    fi
}


# HISTORY
export HISTSIZE=100000


## MDV
export MDV_THEME="884.0134"


## Multiscreen
PATH="$PATH:$HOME/.screenlayout"


## NPM, NVM, Node JS

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## SDK Man
source "$HOME/.sdkman/bin/sdkman-init.sh"

## ORT

alias ort='/home/uuh/dev/oss-review-toolkit/ort/cli/build/install/ort/bin/ort'

## PERL

PATH="/home/uuh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/uuh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/uuh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/uuh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/uuh/perl5"; export PERL_MM_OPT;


## Pygmentize
alias pygmentize='pygmentize -P style=dracula'
alias ccat=pygmentize

## RUBY

export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"


## Rust
export PATH="$PATH:$HOME/.cargo/bin"



## ZSH
source /home/uuh/dev/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

