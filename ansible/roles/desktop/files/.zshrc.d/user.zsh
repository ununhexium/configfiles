# Powerline 10k

source ~/.zshrc.d/p10k.zsh

# ANTIGEN

antigen use oh-my-zsh

# GENERAL PATH

# Custom scripts
export PATH="$PATH:$HOME/.local/scripts:$HOME/.local/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

antigen theme romkatv/powerlevel10k

#antigen bundle mvn
antigen bundle "greymd/docker-zsh-completion"

#zstyle ':completion:*:mvn:*' show-all-phases true
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

antigen apply

export TMP=/tmp/$USER
if [ ! -d "$TMP" ]; then mkdir "$TMP"; fi

# Virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
source "$HOME/.local/bin/virtualenvwrapper_lazy.sh"
# Use python3 venv

# GIT
export MYGIT="$HOME/dev/116/"

export LESS="-j.5 -R --hilite-unread"

# network interface to consider for speedometer
IFACE=enp4s0

# COMPLETION
## Gradle
fpath=(/home/uuh/.zsh/gradle-completion $fpath)

## custom
fpath=(~/.local/scripts/completion $fpath)

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


alias ai='aptinstall'
alias click="xdg-open"
alias cg='cyberghostvpn'
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias df="df -hl"
alias f="fuck"
alias g="git"
alias ikotlin="kotlinc-jvm"
alias listwifi="iwlist wlp2s0 scan"
alias la="lsd --long --all --icon never --"
alias l="lsd --long --all --icon never --"
alias ll=l
alias mvnw="./mvnw"
alias mkvirtualenv3="mkvirtualenv --python=/usr/bin/python3"
alias pipsi="python3 -m pipsi --home $WORKON_HOME"
alias pomodoro='while true; do notify-send Pomodoro Resume; sleep 1500; notify-send --urgency critical --expire-time 300000 Pomodoro Pause; done'
alias rlf='readlink -f'
alias sarahconnor="cd $PWD"
alias speedometer="speedometer -r $IFACE -t $IFACE"
alias zu="vi $HOME/.zshrc.user"

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Allows for item negation in command. For instance, delete all but foo: "rm ^foo"
setopt extended_glob 


#MDV set theme
export MDV_THEME="884.0134"

#move to git repo
function ggo {
    cd $(fzf_ggo)
}

function dgo {
    ranger --choosedir=/tmp/dirselection
    cd $(cat /tmp/dirselection)
}

function echopath() {
	echo $PATH | sed -e "s/:/\n/g"
}

function setup() {
	for s in "$@"; do
		source "/home/uuh/dev/setup/$s"
	done
}

# FZF

FZF_CTRL_R_OPTS="--preview='echo {} | fold --spaces --width=\$FZF_PREVIEW_COLUMNS'"

plugins=(fzf-zsh ripgrep)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
  echo "$1"
  command bfs -L "$1" \
    -name .git -prune -o -name .svn -prune -o \( -type d -o -type f -o -type l \) \
    -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
}

_fzf_compgen_dir() {
  command bfs -L "$1" \
    -name .git -prune -o -name .svn -prune -o -type d \
    -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
}

# HISTORY
export HISTSIZE=100000

#SDK Man
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Multiscreen
PATH="$PATH:$HOME/.screenlayout"

## PERL

PATH="/home/uuh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/uuh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/uuh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/uuh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/uuh/perl5"; export PERL_MM_OPT;

# ZSH
source /home/uuh/dev/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# NPM, NVM, Node JS

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ANDROID

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# FLUTTER
#
export PATH="$PATH:$HOME/app/flutter/current/bin"

# BRYTER
#
export PATH="$PATH:$HOME/.local/bin/bryter"
export BASEURL="http://localhost:8080"

function b(){
    bryter "$@"
}

